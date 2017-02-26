class Admin::BaseController < ApplicationController
  before_action :current_admin

  def current_admin
    render file: '/public/404' unless current_admin?
  end

  def show
    @admin = current_user
  end
end
