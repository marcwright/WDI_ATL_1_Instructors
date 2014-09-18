
var $cat = $('body').append($('<img src="http://i.imgur.com/vL5ff0t.gif">').addClass('cat'))
var $dog = $('body').append($('<img src="http://i.imgur.com/nh4Gi03.jpg">').addClass('dog'))
var $panda = $('body').append($('<img src="http://i.imgur.com/SO6TNF6.jpg">').addClass('panda'))


$( "body" ).on('mousemove', function( event ) {
  var pageCoords = event.pageX + ", " + event.pageY;
  $('.cat').css('margin-top',event.pageY/10).css('margin-left', event.pageX/8);
  $('.dog').css('margin-top',event.pageY/12).css('margin-left', event.pageX/2);
  $('.panda').css('margin-top',event.pageY/2).css('margin-left', event.pageX/4);
  $('body').css('background-color', 'rgba(' + event.pageX +','+ event.pageY + ',' + event.pageX + ',' + ((event.pageX / event.pageY)/10) +')')
});




$('img').on('click', function() {
  $(this).toggleClass('blue-border');
});

