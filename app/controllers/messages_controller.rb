class MessagesController < ApplicationController
  before_action :authenticate!

  def create
    message = @current_user.messages.create(message_params)
    redirect_to message.room
  end

  private

  def authenticate!
     :authenticate_client! || :authenticate_aide!
     @current_user = client_signed_in? ? current_client : current_aide
  end

  def message_params
    params.require(:message).permit(:content, :room_id)
  end
end
