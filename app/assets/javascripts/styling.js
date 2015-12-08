$(function() {


  if ($(window).width() > 500) {
    containerHeight = $("#container").height();
    containerHeight -= 100;
    $("#sidebar").css("min-height", containerHeight);
  } else {
    $("#sidebar").css("min-height", "4em");
  }

})
