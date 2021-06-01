document.addEventListener("turbolinks:load", () => {
  messages = $('#conversation-body');

  if (messages.length > 0) messages.scrollTop(messages.prop("scrollHeight"));
})
