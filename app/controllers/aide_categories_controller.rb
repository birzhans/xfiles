class AideCategoriesController < ApplicationController
  before_action :authorize!
  before_action :set_aide_category, only: [:edit, :update, :destroy]

  def new
    @aide_category = AideCategory.new
  end

  def create
    @aide_category = current_aide.aide_categories.create(aide_category_params)

    if @aide_category.save
      redirect_to profile_aides_path, notice: 'Category was successfully created'
    else
      render :new
    end
  end

  def edit
  end

  def update

    if @aide_category.update(aide_category_params)
      redirect_to profile_aides_path, notice: 'Category was successfully updated'
    else
      render :edit
    end
  end


  def destroy
    @aide_category.destroy
    redirect_to profile_aides_path, notice: 'Category was successfully deleted'
  end

  private

  def authorize!
    redirect_to root_path, notice: 'Restricted access' if !aide_signed_in?
  end

  def set_aide_category
    @aide_category = AideCategory.find(params[:id])
  end

  def aide_category_params
    params.require(:aide_category).permit(:category_id, :description)
  end
end
