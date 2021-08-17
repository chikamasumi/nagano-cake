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

  respond_to do |format|
    if @cart_item.save
      format.html { redirect_to orders_path, notice: 'カートに商品が追加されました。' }
      format.json { render :show, status: :created, location: @cart_item }
    else
      format.html { render :show }
      format.json { render json: @cart_item.errors, status: :unprocessable_entity }
    end
  end
end
