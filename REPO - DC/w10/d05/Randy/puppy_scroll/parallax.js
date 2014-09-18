$(window).scroll(function(){
  var scrollFactor = -($(window).scrollTop())*.15;
  $('.bg').css('top', scrollFactor );
  $('img').css("-webkit-transform", "rotate(" + (scrollFactor*.5) + "deg) ");
});
