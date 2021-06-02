class MessagesController < ApplicationController
  before_action :find_conversation!

  def new
    redirect_to conversation_path(@conversation) and return if @conversation
    @message = current_user.messages.build
  end

  def edit
  end

  def create
    @conversation ||= Conversation.create(author_id: current_user.id, receiver_id: @receiver.id)
    @message = current_user.messages.build(message_params)
    @message.conversation_id = @conversation.id
    @message.save

    SendMessageJob.perform_later(@message)
  end

  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: "Message was successfully updated." }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @message.destroy
    rredirect_to messages_url, notice: "Message was successfully destroyed."
  end

  def delete_message_image
    message_image = ActiveStorage::Attachment.find(params[:id])
    message_image.purge
    redirect_back(fallback_location: conversations_path)
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:body)
    end

    def find_conversation!
      if params[:receiver_id]
        @receiver = User.find(params[:receiver_id])
        redirect_to(root_path) and return unless @receiver
        @conversation = Conversation.between(current_user.id, @receiver.id)[0]
      else
        @conversation = Conversation.find_by(id: params[:conversation_id])
        redirect_to(root_path) and return unless @conversation && @conversation.participates?(current_user)
      end
    end
end
