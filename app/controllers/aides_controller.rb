class AidesController < ApplicationController
  before_action :set_aide, only: [:show]
  def index

    city_id = params[:city_id]
    category_id = params[:category_id]
    @option_city = city_id || 'All'
    @option_category = category_id || 'All'

    @aides = Aide.search(city_id, category_id)

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
