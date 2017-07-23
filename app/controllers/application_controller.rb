class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def check_user
    @user = User.find(params[:user_id])
    if @user == current_user
    else
      render "shared/404"
    end
  end
end
