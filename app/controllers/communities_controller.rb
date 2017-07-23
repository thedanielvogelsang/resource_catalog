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

  def edit
    @user = current_user
    @community = Community.find(params[:id])
    if @user.admin?
    else
      render "shared/404"
    end
  end

  def update
    @community = Community.find(params[:id])
    @community.update(community_params)
    if @community.save
      flash[:success] = "Community updated and saved!"
      redirect_to community_path(@community)
    else
      flash[:error] = "Update failed"
      redirect_to edit_community_path(@community)
    end
  end

  def destroy
    @user = current_user
    @community = Community.find(params[:id])
    if @user.admin?
      @community.destroy
      redirect_to user_path(@user)
    else
      redirect_to community_path(@community)
    end
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
