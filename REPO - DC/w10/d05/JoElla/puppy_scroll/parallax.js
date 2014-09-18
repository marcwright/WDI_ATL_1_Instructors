$(window).on('scroll', function(){
  var scrolled = $(window).scrollTop();
  $('.bg').css('top', -scrolled * .3);
  $('img').css('-webkit-transform', 'scale( ' + (scrolled / 300) + 'deg)');
});
