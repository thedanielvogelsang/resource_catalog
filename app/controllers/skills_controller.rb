class SkillsController < ApplicationController
  def new
      @skill = Skill.new()
  end

  def create
    @skill = Skill.create(skill_params)
    if @skill
      flash[:success] = "nice! we didn't know you could do that!"
      redirect_to skills_path
    else
      flash[:error] = "invalid skill"
      redirect_to new_skill_path
    end
  end

  def index
    @skills = Skill.all
    @skill = Skill.new()
  end

  private

    def skill_params
      params.require(:skill).permit(:skill)
    end

end
