document.addEventListener("turbolinks:load", () => {
  messages = $(".chat");
  messages.niceScroll();
  console.log(messages);
  if (messages.length > 0) messages.scrollTop(messages.prop("scrollHeight") * messages.prop("scrollHeight"));

})
