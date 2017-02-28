class Admin::OrdersController < Admin::BaseController

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:success] = "Order successfully updated."
      redirect_back(fallback_location: 'admin/dashboard')
    else
      redirect_back(fallback_location: 'admin/dashboard')
    end
  end

  private

  def order_params
    params.permit(:status, :user_id)
  end
end
