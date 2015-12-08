$(function() {

  function reSidebar(){
    if ($(window).width() > 500) {
      var containerHeight = $("#container").height();
      containerHeight -= 100;
      $("#sidebar").css("min-height", containerHeight);
    } else {
      $("#sidebar").css("min-height", "4em");
    }
  }

  reSidebar();

  $("#next-feature").on("click", function(event){
    event.preventDefault();
    var grabbedId = $(".feature-id-grabber").attr("id");
    var data = {current_id: grabbedId};
    var request = $.get(
      url = "/index/next",
      data = data
    );
    request.done( function(htmlResponse){
      $("#feature-box").html(htmlResponse);
      reSidebar();
    });

  });

});
