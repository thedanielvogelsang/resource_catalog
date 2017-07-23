class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Login Successful"
      redirect_to user_path @user
    else
      flash[:notice] = "Invalid Login"
      redirect_to :root
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] =  "Successfully logged out"
    redirect_to :root
  end
end
