document.addEventListener("turbolinks:load", () => {
  messages = $(".chat");
  messages.niceScroll();
  if (messages.length > 0) messages.scrollTop(messages.prop("scrollHeight") + 300);

})
