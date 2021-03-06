require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ShoppingCartLineItemsController do

  # This should return the minimal set of attributes required to create a valid
  # ShoppingCartLineItem. As you add validations to ShoppingCartLineItem, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "shopping_cart" => "" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ShoppingCartLineItemsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all shopping_cart_line_items as @shopping_cart_line_items" do
      shopping_cart_line_item = ShoppingCartLineItem.create! valid_attributes
      get :index, {}, valid_session
      assigns(:shopping_cart_line_items).should eq([shopping_cart_line_item])
    end
  end

  describe "GET show" do
    it "assigns the requested shopping_cart_line_item as @shopping_cart_line_item" do
      shopping_cart_line_item = ShoppingCartLineItem.create! valid_attributes
      get :show, {:id => shopping_cart_line_item.to_param}, valid_session
      assigns(:shopping_cart_line_item).should eq(shopping_cart_line_item)
    end
  end

  describe "GET new" do
    it "assigns a new shopping_cart_line_item as @shopping_cart_line_item" do
      get :new, {}, valid_session
      assigns(:shopping_cart_line_item).should be_a_new(ShoppingCartLineItem)
    end
  end

  describe "GET edit" do
    it "assigns the requested shopping_cart_line_item as @shopping_cart_line_item" do
      shopping_cart_line_item = ShoppingCartLineItem.create! valid_attributes
      get :edit, {:id => shopping_cart_line_item.to_param}, valid_session
      assigns(:shopping_cart_line_item).should eq(shopping_cart_line_item)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ShoppingCartLineItem" do
        expect {
          post :create, {:shopping_cart_line_item => valid_attributes}, valid_session
        }.to change(ShoppingCartLineItem, :count).by(1)
      end

      it "assigns a newly created shopping_cart_line_item as @shopping_cart_line_item" do
        post :create, {:shopping_cart_line_item => valid_attributes}, valid_session
        assigns(:shopping_cart_line_item).should be_a(ShoppingCartLineItem)
        assigns(:shopping_cart_line_item).should be_persisted
      end

      it "redirects to the created shopping_cart_line_item" do
        post :create, {:shopping_cart_line_item => valid_attributes}, valid_session
        response.should redirect_to(ShoppingCartLineItem.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved shopping_cart_line_item as @shopping_cart_line_item" do
        # Trigger the behavior that occurs when invalid params are submitted
        ShoppingCartLineItem.any_instance.stub(:save).and_return(false)
        post :create, {:shopping_cart_line_item => { "shopping_cart" => "invalid value" }}, valid_session
        assigns(:shopping_cart_line_item).should be_a_new(ShoppingCartLineItem)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ShoppingCartLineItem.any_instance.stub(:save).and_return(false)
        post :create, {:shopping_cart_line_item => { "shopping_cart" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested shopping_cart_line_item" do
        shopping_cart_line_item = ShoppingCartLineItem.create! valid_attributes
        # Assuming there are no other shopping_cart_line_items in the database, this
        # specifies that the ShoppingCartLineItem created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ShoppingCartLineItem.any_instance.should_receive(:update_attributes).with({ "shopping_cart" => "" })
        put :update, {:id => shopping_cart_line_item.to_param, :shopping_cart_line_item => { "shopping_cart" => "" }}, valid_session
      end

      it "assigns the requested shopping_cart_line_item as @shopping_cart_line_item" do
        shopping_cart_line_item = ShoppingCartLineItem.create! valid_attributes
        put :update, {:id => shopping_cart_line_item.to_param, :shopping_cart_line_item => valid_attributes}, valid_session
        assigns(:shopping_cart_line_item).should eq(shopping_cart_line_item)
      end

      it "redirects to the shopping_cart_line_item" do
        shopping_cart_line_item = ShoppingCartLineItem.create! valid_attributes
        put :update, {:id => shopping_cart_line_item.to_param, :shopping_cart_line_item => valid_attributes}, valid_session
        response.should redirect_to(shopping_cart_line_item)
      end
    end

    describe "with invalid params" do
      it "assigns the shopping_cart_line_item as @shopping_cart_line_item" do
        shopping_cart_line_item = ShoppingCartLineItem.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ShoppingCartLineItem.any_instance.stub(:save).and_return(false)
        put :update, {:id => shopping_cart_line_item.to_param, :shopping_cart_line_item => { "shopping_cart" => "invalid value" }}, valid_session
        assigns(:shopping_cart_line_item).should eq(shopping_cart_line_item)
      end

      it "re-renders the 'edit' template" do
        shopping_cart_line_item = ShoppingCartLineItem.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ShoppingCartLineItem.any_instance.stub(:save).and_return(false)
        put :update, {:id => shopping_cart_line_item.to_param, :shopping_cart_line_item => { "shopping_cart" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested shopping_cart_line_item" do
      shopping_cart_line_item = ShoppingCartLineItem.create! valid_attributes
      expect {
        delete :destroy, {:id => shopping_cart_line_item.to_param}, valid_session
      }.to change(ShoppingCartLineItem, :count).by(-1)
    end

    it "redirects to the shopping_cart_line_items list" do
      shopping_cart_line_item = ShoppingCartLineItem.create! valid_attributes
      delete :destroy, {:id => shopping_cart_line_item.to_param}, valid_session
      response.should redirect_to(shopping_cart_line_items_url)
    end
  end

end
