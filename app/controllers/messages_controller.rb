class MessagesController < ApplicationController
  # before_action :set_message, only: %i[ show edit update destroy ]
  before_action :find_conversation!

  # GET /messages/new
  def new
    redirect_to conversation_path(@conversation) and return if @conversation
    @message = current_user.messages.build
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages or /messages.json
  def create
    # @message = Message.new(message_params)
    @conversation ||= Conversation.create(author_id: current_user.id, receiver_id: @receiver.id)
    @message = current_user.messages.build(message_params)
    @message.conversation_id = @conversation.id
    puts "create message"
    respond_to do |format|
      if @message.save
        format.html { redirect_to conversation_path(@conversation), notice: "Message sent." }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { redirect_to request.referrer, notice: "Failed to send a message!" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1 or /messages/1.json
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

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: "Message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def delete_message_image
    message_image = ActiveStorage::Attachment.find(params[:id])
    message_image.purge
    redirect_back(fallback_location: conversations_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
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
