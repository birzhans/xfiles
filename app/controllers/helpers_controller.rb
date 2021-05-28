class HelpersController < ApplicationController
  before_action :set_helper, only: [:show]
  def index
    @helpers = Helper.all
  end

  def show
  end

  def profile
  end

  private

  def set_helper
    @helper = Helper.find(params[:id])
  end
end
