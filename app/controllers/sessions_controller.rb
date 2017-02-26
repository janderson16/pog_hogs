class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      if user.role == 'admin'
        redirect_to admin_dashboard_path
      else
        redirect_to '/dashboard'
      end
      flash[:notice] = "Logged in as #{user.first_name} #{user.last_name}"
    else
      flash[:notice] = "Incorrect email and/or password"
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Logged Out"
    redirect_to root_path
  end
end
