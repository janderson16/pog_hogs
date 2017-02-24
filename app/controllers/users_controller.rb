class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to PogHogs #{@user.first_name}"
      session[:user_id] = @user.id
      redirect_to '/dashboard'
    elsif User.exists?(['email LIKE ?', "%#{@user.email}%"])
      flash[:notice] = "Email already registered with an account!"
      redirect_to new_user_path
    else
      flash[:notice] = "Please check that all fields were filled in correctly."
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
