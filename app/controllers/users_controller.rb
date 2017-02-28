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
      flash[:success] = "Welcome to PogHogs #{@user.first_name}"
      session[:user_id] = @user.id
      redirect_to '/dashboard'
    elsif User.exists?(['email LIKE ?', "%#{@user.email}%"])
      flash[:error] = "Email already registered with an account!"
      redirect_to new_user_path
    else
      flash[:notice] = "Please check that all fields were filled in correctly."
      redirect_to new_user_path
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:success] = "Your Profile has been updated."
      if @user.role == 'admin'
        redirect_to admin_dashboard_path
      else
        redirect_to '/dashboard'
      end
    else
      redirect_to :edit
    end
  end
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :address)
  end
end
