class LocationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_location, only: [:edit, :update, :destroy]

  def new
    @location = Location.new
  end

  def edit
  end

  def create
    @location = current_user.locations.create(location_params)

    if @location.save
      redirect_to profile_path, notice: 'Location has successfully added'
    else
      render :new
    end
  end

  def update
    if @location.update(location_params)
      redirect_to profile_path, notice: 'Location has successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @location.destroy

    redirect_to profile_path, notice: 'Location has successfully deleted'
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:city_id, :address)
  end
end
