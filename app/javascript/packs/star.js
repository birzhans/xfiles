$(document).ready(function(){
  $(".star-icon").on('click', function() {

    var id = $(this).attr("data-id");
    console.log(id);
    var star = $("#star-" + id);
    if (star.hasClass("far")) {
      star.removeClass("far");
      star.addClass("fa");
    } else {
      star.removeClass("fa");
      star.addClass("far");
    }
  })
})
