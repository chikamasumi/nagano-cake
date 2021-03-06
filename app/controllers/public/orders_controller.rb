class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
   @order = Order.new
    if current_customer.cart_items.empty?
      redirect_to cart_items_path
    end
    @customer = current_customer
    @address = current_customer.addresses
  end

  def create
    params[:order][:payment_method] = params[:order][:payment_method].to_i
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @order_ditail = OrderDitail.new
      @order_ditail.order_id = @order.id
      @order_ditail.item_id = cart_item.item.id
      @order_ditail.price = cart_item.item.price
      @order_ditail.amount = cart_item.amount
      @order_ditail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to compleate_orders_path
  end

  def confirm
    @order = Order.new
    if params[:order][:payment_method].nil?
      @customer = current_customer
      @address = current_customer.addresses
      render :new
    end
    @order.payment_method = params[:order][:payment_method].to_i
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.last_name + current_customer.first_name
    @shipping = 800
    @total_price = 0
    @payment = 0
  end

  def index
    @order = current_customer.orders
  end

  def show
    @order_ditail = OrderDitail.find_by(order_id: params[:id])
    @order_ditails = Order.find(params[:id]).order_ditails.all
    @shipping = 800
    @total_price = 0
    @payment = 0
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :address, :postal_code, :name, :payment)
  end
end
