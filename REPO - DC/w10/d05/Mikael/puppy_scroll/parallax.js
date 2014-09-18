$(window).on('scroll', function() {
  var scrolled = $(window).scrollTop();
  // console.log(scrolled);

  $('.bg').css('top', scrolled);
});
