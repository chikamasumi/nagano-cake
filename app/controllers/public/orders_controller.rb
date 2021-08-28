class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
    @customer = current_customer
    @address = Address.all
  end

  def create
    order = Order.new(order_params)
    @order_ditails = Order_ditail.new(order_ditail_params)
    order.save
    @order_ditail.save
    redirect_to confirm_orders_path
  end

  def confirm
    @order_ditails = @order.order_ditails.page(params[:page]).reverse_order
    #@order_ditail = OrderDitail.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :address, :postal_code, :name)
  end

  def order_ditail_params
    params.require(:order_ditail).permit(:cart_item_id, :amount)
  end
end
