class TitleListMembership < ActiveRecord::Base
  belongs_to :title
  belongs_to :title_list
  attr_accessible :notes,:title_id,:title_list_id,:title
end
