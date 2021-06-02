class SkillsController < ApplicationController
  before_action :authorize!
  before_action :set_skill, only: [:edit, :update, :destroy]

  def new
    @skill = Skill.new
  end

  def create
    @skill = current_user.aide.skills.create(skill_params)

    if @skill.save
      redirect_to profile_path, notice: 'Category was successfully created'
    else
      render :new
    end
  end

  def edit
  end

  def update

    if @skill.update(skill_params)
      redirect_to profile_path, notice: 'Category was successfully updated'
    else
      render :edit
    end
  end


  def destroy
    @skill.destroy
    redirect_to profile_path, notice: 'Category was successfully deleted'
  end

  private

  def authorize!
    redirect_to root_path, notice: 'Restricted access' if !current_user.aide?
  end

  def set_skill
    @skill = Skill.find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(:category_id, :description)
  end
end
