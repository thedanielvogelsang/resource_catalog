class SkillsController < ApplicationController
  def new
    @skill = Skill.new()
  end

  def create
    if @skill = Skill.create(skill_params)
      redirect_to skills_path
    else
      redirect_to new_skill_path
    end
  end

  private

    def skill_params
      params.require(:skill).permit(:skill)
    end
end
