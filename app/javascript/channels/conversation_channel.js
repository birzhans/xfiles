import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  const conversation_id = Number($("#channel_conversation_id").attr("data_conversation_id"));
  console.log(conversation_id);


  consumer.subscriptions.subscriptions.forEach((subscription) => {
      consumer.subscriptions.remove(subscription)
  })

  consumer.subscriptions.create({ channel: "ConversationChannel", conversation_id: conversation_id }, {
    connected() {  },

    disconnected() {},

    received(data) {
      console.log(data.mine);
      let message;
      const user_id = Number($("#channel_user_id").attr("data_user_id"));
      const data_user_id = Number(data.user_id);
      if (user_id === data_user_id) {
        message = data.mine;
      } else {
        message = data.theirs;
      }

      const messages = document.getElementById("messages");
      messages.innerHTML += message;
      $("#message_body").val('');
    }
  });
})
