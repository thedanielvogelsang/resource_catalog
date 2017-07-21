class SkillsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @skill = Skill.new()
  end

  def create
    @user = User.find(params[:user_id])
    @skill = Skill.new(skill_params)
    if @skill.save
      @user.skills << @skill
      flash[:success] = "nice! we didn't know you could do that!"
      redirect_to user_skills_path(@user)
    else
      flash[:error] = "invalid skill"
      redirect_to new_user_skill_path(@user)
    end
  end

  def index
    @skill = Skill.new()
    @user = User.find(params[:user_id])
  end

  private

    def skill_params
      params.require(:skill).permit(:skill)
    end

end
