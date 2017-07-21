class SharablesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @sharable = Sharable.new()
    if @user.skills.count == 2
      flash[:error] = "Nice, now give us at least one more."
      redirect_to user_skills_path(@user)
    elsif @user.skills.count == 0 || @user.skills.count == 1
      flash[:error] = "You can't move on without listing more skills!"
      redirect_to new_user_skill_path(@user)
    else
    end
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
