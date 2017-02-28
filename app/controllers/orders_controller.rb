class OrdersController < ApplicationController

  def index
    @orders = current_user.orders
  end

  def create
    order = current_user.orders.create(status: 0)
    Checkout.new(@cart.contents).place_order(order)
    session.delete(:cart)
    flash[:success] = "Order was successfully placed"
    redirect_to orders_path
  end

  def show
      @order = current_user.orders.find(params[:id])
  end
end
