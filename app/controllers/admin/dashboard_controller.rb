class Admin::DashboardController < Admin::BaseController

  def dashboard
    if params[:current_status]
      @orders = Order.where(status: params[:current_status])
    else
      @orders = Order.order(:id)
    end
    @all_orders = Order.all
    render :admin_dashboard
  end
end
