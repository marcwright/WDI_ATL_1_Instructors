$(window).on('scroll', function() {
  var scrolled = $(window).scrollTop();
  $('.bg').css('top', scrolled * -1.4)
  // $('.top-left').css('bottom', scrolled * .3).fadeOut( "slow" )
  $('.top-center').css('top', scrolled * .9)
  $('.top-right').css('top', scrolled * 1.1)
  // $('img').css('-webkit-transform', 'rotate(' + (scrolled .5 ) + 'deg)');
});
