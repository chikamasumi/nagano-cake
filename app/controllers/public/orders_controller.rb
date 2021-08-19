class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def comfirm
    @order_ditails = @order.order_ditails.page(params[:page]).reverse_order
  end
end
