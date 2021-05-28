class AidesController < ApplicationController
  before_action :set_aide, only: [:show]
  def index
    city_id = params[:city_id]
    if !city_id || city_id.eql?('All')
      @aides = Aide.all
    else
      @aides = Aide.get_by_city(city_id)
    end
    @option = city_id || 'All'
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
