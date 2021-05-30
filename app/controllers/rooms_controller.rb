class RoomsController < ApplicationController
  before_action :authenticate!
  before_action :set_room, only: [:show, :destroy]
  before_action :set_rooms, only: [:index, :show]

  def index
  end

  def show
    render :index
  end

  def create
    @room = Room.create(room_params)
    redirect_to @room, notice: 'Room was successfuly created'
  end

  def destroy
    @room.destroy
    redirect_to rooms_path
  end

  private

  def authenticate!
     :authenticate_client! || :authenticate_aide!
     @current_user = client_signed_in? ? current_client : current_aide
  end

  def set_room
    @room = Room.find(params[:id])
  end

  def set_rooms
    @rooms = Room.all
  end

  def room_params
    params.require(:room).permit(:name)
  end
end
