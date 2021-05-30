import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  const room_id = Number($("#room_id").attr("data_room_id"));

  consumer.subscriptions.subscriptions.forEach((subscription) => {
      consumer.subscriptions.remove(subscription)
  })

  consumer.subscriptions.create({ channel: "RoomChannel", room_id: room_id }, {
    connected() {
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      let message;
      const user_id = Number($("#user_id").attr("data_user_id"));
      const data_user_id = Number(data.user_id);
      if (user_id === data_user_id) {
        message = data.mine;
      } else {
        message = data.theirs;
      }

      const messages = document.getElementById("messages");
      messages.innerHTML += message;
      $("#message_content").val('');
    }
  });
})
