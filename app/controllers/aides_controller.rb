class AidesController < ApplicationController
  before_action :set_aide, only: [:show]
  def index
    @aides = Aide.all
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
