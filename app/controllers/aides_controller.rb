class AidesController < ApplicationController
  before_action :authorize_aide
  before_action :set_aide, only: [:show]

  def index
    city_id, category_id = params[:city_id], params[:category_id]
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

  def authorize_aide
    redirect_to(root_path, alert: 'Not allowed to view this page') unless aide_signed_in?
    @current_user = current_aide
  end
end
