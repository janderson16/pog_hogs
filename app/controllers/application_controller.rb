class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart
  helper_method :current_user, :authorize!, :all_categories

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def current_user
    @user ||=User.find(session[:user_id]) if session[:user_id]
  end

  def authorize!
    render file: "/public/404" unless current_user && current_admin?
  end

  def current_admin?
    if current_user.role == 1
      true
    else
      false
    end
  end

  def all_categories
    categories = Category.all
  end
end
