$(window).on('scroll', function(){
  var scrolled = $(window).scrollTop();
  $('.bg').css('top', scrolled * -1.5);
  $('.top-left').css('top', (scrolled * 0.8) + 'px');
  $('.top-left').css('left', (scrolled * 0.8) + 'px');
  $('.top-right').css('top', (scrolled * 0.8) + 'px');
  $('.top-right').css('right', (scrolled * 0.8) + 'px');
  $('.top-center').css('top', scrolled * 1.2);  
  $('img').css('-webkit-transform', 'rotate(' + (scrolled * 0.5) + 'deg)');
  // $('img').css('-webkit-transform', 'scale(' + (scrolled / 300) + ')');

});