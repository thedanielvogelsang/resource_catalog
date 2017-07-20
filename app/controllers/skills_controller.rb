class SkillsController < ApplicationController
  def new
    @skill = Skill.new()
  end
end
