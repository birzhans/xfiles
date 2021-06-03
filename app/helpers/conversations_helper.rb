module ConversationsHelper
  def last_message(conversation)
    if !conversation.messages.empty?
      conversation.messages.last.body.truncate(50)
    else
      '(No messages)'
    end
  end
end
