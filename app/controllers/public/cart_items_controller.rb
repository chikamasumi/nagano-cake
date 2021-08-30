class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @cart_items = CartItem.all
    @cart_item = CartItem.new
  end

  def create
    #@cart_item = CartItem.new(cart_item_params)
    #@cart_item.customer_id = current_customer.id
    #if @cart_item.save
      #flash[:notice] = "カートに追加しました"
      #redirect_to cart_items_path
    #end
    @cart_item = current_customer.cart_items.build(cart_item_params)
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      if cart_item.item_id == @cart_item.item_id
        new_amount = cart_item.amount + @cart_item.amount
        cart_item.update_attribute(:amount, new_amount)
        @cart_item.delete
      end
    end
    @cart_item.save
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.permit(:item_id, :customer_id, :amount)
  end

end
