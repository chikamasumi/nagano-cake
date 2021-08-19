class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    cart_item = CartItem.find(params[:cart_item_id])
  end

end
