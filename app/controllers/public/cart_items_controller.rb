class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @cart_items = CartItem.all
    @cart_item = CartItem.new
    @total_price = 0
  end

  def create
    #@cart_item = CartItem.new(cart_item_params)
    #@cart_item.customer_id = current_customer.id
    #if @cart_item.save
      #flash[:notice] = "カートに追加しました"
      #redirect_to cart_items_path
    #end
    item = CartItem.new(cart_item_params)
    cart_item = current_customer.cart_items.find_by(item_id: item.item_id)
    if cart_item.present?
      new_amount = cart_item.amount + item.amount
      cart_item.update_attribute(:amount, new_amount)
    else
      item.save
    end
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end

end
