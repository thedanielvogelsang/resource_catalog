class SharablesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @sharable = Sharable.new()
  end

  def index
    @user = User.find(params[:user_id])
    @sharable = Sharable.new()
  end

  def create
  @user = User.find(params[:user_id])
  @sharable = Sharable.new(sharable_params)
    if @sharable.save
      @user.sharables << @sharable
      flash[:success] = "hey! we could use that for sure!"
      redirect_to user_sharables_path(@user)
    else
      flash[:error] = "no resource given"
      redirect_to user_sharables_path(@user)
    end
  end


  private

    def sharable_params
      params.require(:sharable).permit(:sharable)
    end

end
