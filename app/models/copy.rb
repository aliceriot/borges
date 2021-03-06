class Copy < ActiveRecord::Base
  attr_accessible :cost_in_cents, :is_used, :notes, :price_in_cents , :cost, :price, :inventoried_when, :deinventoried_when, :status, :owner,:edition_id,:invoice_line_item_id, :owner_id

  belongs_to :edition, :touch => true
  has_one :title, :through => :edition
  belongs_to :invoice_line_item
  has_one :invoice,:through => :invoice_line_item 
  has_one :sale_order_line_item
  has_one :sale_order,:through => :sale_order_line_item 
  has_one :return_order_line_item
  has_one :return_order,:through => :return_order_line_item 
  belongs_to :owner
  has_many :inventory_copy_confirmations  
  monetize :cost_in_cents, :as => "cost"
  monetize :price_in_cents, :as => "price"

  scope :instock, where("status"=>"STOCK")
  scope :lost, where("status"=>"LOST")
  scope :returned, where("status"=>"RETURNED")
  scope :sold, where("status"=>"SOLD")
  
  before_validation :set_cost
  #after_save :reindex_title

  def info
    "$#{price}" + (notes || is_used? ? " [#{notes} #{'USED' if is_used?}]" : "" )
  end

  def sell(sale_price)
    self.price=sale_price # this comes from the line item
    self.status="SOLD"
    self.deinventoried_when=DateTime.now
    self.save!
  end

  def set_cost
    unless self.cost
      self.cost = 0
      self.cost_in_cents = 0
    end
  end
  
  def do_return()
    self.status="RETURNED"
    self.deinventoried_when=DateTime.now
    self.save!
  end

  def mark_probablyreturned()
    if self.status=="STOCK"
      self.status="PROBABLYRETURNED"
      self.deinventoried_when=DateTime.now
      self.save!
    end
  end

  def mark_lost()
    if self.status=="STOCK"
      self.status="LOST"
      self.deinventoried_when=DateTime.now
      self.save!
    end
  end

  def confirm(inventory)
    @inventory_copy_confirmation = InventoryCopyConfirmation.new(:copy_id=>self.id,:inventory_id=>inventory.id)
    @inventory_copy_confirmation.status=true
    @inventory_copy_confirmation.save!
  end

  private 
  def reindex_title 
    self.title.save! # does it reindex?
  end
end
