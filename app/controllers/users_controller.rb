class UsersController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User data success."
      redirect_to new_user_skill_path(@user)
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
