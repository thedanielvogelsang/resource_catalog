class SkillsController < ApplicationController
  before_action :check_user, only: [:index]

  def new
    @user = User.find(params[:user_id])
    @skill = Skill.new()
  end

  def create
    @user = User.find(params[:user_id])
    @skill = Skill.new(skill_params)
    if @skill.save && @user.skills.count == 2
      @user.skills << @skill
      flash[:success] = "Alright that'll do for now. Well done. Continue adding if you'd like, but feel free to move on if you're ready. There'll be more chances to add skills later.."
      redirect_to user_skills_path(@user)
    elsif @skill.save
      @user.skills << @skill
      flash[:success] = "Fantastic! We didn't know you could do that! What else you got?"
      redirect_to user_skills_path(@user)
    else
      flash[:error] = "invalid skill... can't move on without listing at least three!"
      redirect_to user_create_skills_path(@user)
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
