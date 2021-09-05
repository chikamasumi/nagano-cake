class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @order = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_ditail = OrderDitail.find_by(order_id: params[:id])
    @order_ditails = Order.find(params[:id]).order_ditails.all
    @shipping = 800
    @total_price = 0
    @payment = 0
  end
end
