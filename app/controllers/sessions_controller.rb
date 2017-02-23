class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to "/dashboard"
      flash[:notice] = "Logged in as #{user.first_name} #{user.last_name}"
    else
      flash[:notice] = "Unknown email and/or password"
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Logged Out"
    redirect_to root_path
  end
end
