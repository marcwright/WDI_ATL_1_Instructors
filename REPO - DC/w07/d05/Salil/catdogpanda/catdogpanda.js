var $snoop = $('<img src="http://www.placedoge.net/200/300">').addClass('snoopDoge');
$("body").append($snoop);


var $corgi = $('<img src="http://placecorgi.com/260/180">').addClass('corgi');
$("body").append($corgi);


var $doge = $('<img src="http://www.placedoge.net/96/139">').addClass('doge');
$("body").append($doge);

var i=0;
$('body').mousemove(function(event) {
  var msg = 'Coordinates - x : ' + event.pageX + ', y : '
                + event.pageY;
  $('h1').text(msg);

  $('.snoopDoge').css({'margin-left': event.pageX/4, 'margin-top': event.pageY/4});
  $('.doge').css({'margin-left': event.pageX/20, 'margin-top': event.pageY/20});
  $('.corgi').css({'margin-left': event.pageX/10, 'margin-top': event.pageY/10});
});

$('img').on('click', function(event) {
  event.stopPropagation();
  $(this).toggleClass('blue-border');
});

$('body').on('click', function(){
  $('body').off('mousemove');
});
