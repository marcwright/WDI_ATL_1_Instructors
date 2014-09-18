
$(window).on("scroll", function() {

  var scrolled = $(window).scrollTop();
  $(".bg").css("top", scrolled * -1.5);
  $(".top").css("left", scrolled * 0.6);
  $(".top").css("-webkit-transform", "rotate(" + (scrolled * 0.3) + "deg) ");

  if (scrolled >= 582) {
    $(".bottom").css("right", (scrolled - 582) * 0.6);
    $(".bottom").css("-webkit-transform", "rotate(" + ((scrolled - 582) * 0.3) + "deg) ");
  }

});
