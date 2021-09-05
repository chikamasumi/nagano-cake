class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @order = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end
end
