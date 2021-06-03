class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversations, only: [:index, :show]
  before_action :set_conversation, except: [:index]
  before_action :check_participating!, except: [:index]

  def index
  end

  def new
    redirect_to conversation_path(@conversation) and return if @conversation
    @message = current_user.personal_messages.build
  end

  def show
    @message = Message.new
  end

  private

  def set_conversations
    @conversations = Conversation.participating(current_user).order('updated_at DESC')
  end

  def set_conversation
    if params[:receiver_id]
      @receiver = User.find_by(id: params[:receiver_id])
      redirect_to(root_path) and return unless @receiver
      @conversation = Conversation.between(current_user.id, @receiver.id)[0]

      unless @conversation
        @conversation = Conversation.create(author_id: current_user.id, receiver_id: @receiver.id)
      end
    else
      @conversation = Conversation.find(params[:id])
    end
  end

  def check_participating!
    redirect_to root_path unless @conversation && @conversation.participates?(current_user)
  end
end
