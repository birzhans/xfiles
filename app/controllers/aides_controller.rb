class AidesController < ApplicationController
  before_action :set_aide, only: [:show]

  def index
    @aides = Aide.filter(params.slice(:category, :city))
    @category_option, @city_option = params[:category], params[:city]
  end

  def show
  end

  def profile
  end

  private

  def set_aide
    @aide = Aide.find(params[:id])
  end
end
