$(function() {

  function reSidebar(){
    if ($(window).width() > 500) {
      var footerHeight = $("footer").height() + 1;
      var containerHeight = $("#container").height();
      containerHeight -= footerHeight;
      $("#sidebar").css("min-height", containerHeight);
    } else {
      $("#sidebar").css("min-height", "4em");
    }
  }

  function markdownGo(){
    if ($("#markdownContent") === undefined ) {
      return
    } else {
    var markdownContent = $("#markdown-content").html();
    markedHtml = markdown.toHTML( markdownContent );
    $("#markdown-content").html( markedHtml );
    }
  };

  markdownGo();
  reSidebar();

  $("#feature-box").on("click", "#next-feature", function(event){
    event.preventDefault();
    var grabbedId = $(".feature-id-grabber").attr("id");
        console.log(grabbedId)
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

  $("#feature-box").on("click", "#prev-feature", function(event){
    event.preventDefault();
    var grabbedId = $(".feature-id-grabber").attr("id");

    var data = {current_id: grabbedId};
    var request = $.get(
      url = "/index/prev",
      data = data
    );
    request.done( function(htmlResponse){
      $("#feature-box").html(htmlResponse);
      reSidebar();
    });
  });

  $(window).on("resize", function(event){
    reSidebar();
  });



});
