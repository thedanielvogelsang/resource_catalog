class CommunitiesController < ApplicationController
  before_action :check_status, only: [:show]
  def new
    @user = User.find(params[:user_id])
    @community = Community.new()
  end

  def create
    @user = User.find(params[:user_id])
    @community = Community.new(community_params)
    if @community.save
      Admin.create(user: @user, community: @community)
      @user.communities << @community
      redirect_to community_path @community
    else
      render :new
    end
  end

  def show

  end

  private

    def community_params
      params.require(:community).permit(:name, :description)
    end

    def check_status
      @user = current_user
      @community = Community.find(params[:id])
      if Community.joins(:admins).where(admins: {user_id: @user.id}).include? @community
        @user.role = 1
      elsif @user.communities.include?(@community)
      else
        render "/shared/404"
      end
    end
end
