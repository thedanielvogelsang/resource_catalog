class WelcomeController < ApplicationController
  def index
    if current_user
      @user = current_user
      render :index2
    else
      render :index
    end
  end
end
