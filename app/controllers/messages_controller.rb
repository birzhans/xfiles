class MessagesController < ApplicationController
  before_action :set_conversation

  def create
    @message = current_user.messages.build(message_params)
    @message.conversation_id = @conversation.id
    @message.save!

    flash[:success] = "Your message was sent!"
    redirect_to conversation_path(@conversation)
  end

  private

  def set_conversation
    @conversation = Conversation.find_by(id: params[:conversation_id])
    redirect_to(root_path) and return unless @conversation && @conversation.participates?(current_user)
  end

  def message_params
    params.require(:message).permit(:body)
  end
end
