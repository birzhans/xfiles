class RoomsController < ApplicationController
  def index
    # code
  end

  def show
    # code
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end
end
