class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(message)

    mine = ApplicationController.render(
      partial: 'messages/mine',
      locals: {message: message}
    )

    theirs = ApplicationController.render(
      partial: 'messages/theirs',
      locals: {message: message}
    )

    ActionCable.server.broadcast(
      "conversation_channel_#{message.conversation.id}",
      mine: mine,
      theirs: theirs,
      user_id: message.user.id
    )
  end
end
