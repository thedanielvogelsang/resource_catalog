class UsersController < ApplicationController
  before_action :check_user, only: [:show]
  
  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User data success. Now log in"
      redirect_to login_path
    else
      flash[:error] = "Unsuccessful User Creation"
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    if @user == current_user
      render :show
    else
      render "shared/404"
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone, :email, :address, :zipcode, :password, :password_confirmation, :username)
  end
end
