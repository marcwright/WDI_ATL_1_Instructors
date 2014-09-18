
$(window).on('scroll', function() {
  var scrolled = $(window).scrollTop();
  $('.bg').css('top', scrolled * -1.5);

  $('.top-left').css('top', scrolled * .8 + 'px');
  $('.top-left').css('left', scrolled * .8);
  $('.top-center').css('top', scrolled * 1.2);
  $('.top-right').css('top', scrolled * .9);
  $('.top-right').css('transform', 'rotate(' + (scrolled * .5) + 'deg)');
  $('.bottom-right').css('transform', 'scale(' + (scrolled/300) + ')');
  $('.bottom-right').css('top', scrolled * -.8 + 'px');
  $('.bottom-right').css('left', scrolled * -.5 + 'px');
  $('.bottom-center').css('transform', 'rotate(' + (scrolled * .5) + 'deg)');
  $('.bottom-center').css('z-index', '100');
  $('.top-right').css('z-index', '100');
  $('.top-center').css('z-index', '100');
  $('.bottom-left').css('transform', 'scale(' + (scrolled/500) + ')');
});

