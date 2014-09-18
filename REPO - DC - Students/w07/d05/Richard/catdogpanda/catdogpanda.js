/*
* @Author: Richard Hessler
* @Date:   2014-06-06 16:06:24
* @Last Modified by:   Richard Hessler
* @Last Modified time: 2014-06-06 17:31:53
*/

$('body').append($('<img>').attr('src', 'http://cupcakepedia.com/wp-content/uploads/2013/12/cute-cat-love2.jpg').addClass('cat'))

$('body').append($('<img>').attr('src', 'http://growld.com/wp-content/uploads/2014/02/so-doge-feature.jpg').addClass('dog'))

$('body').append($('<img>').attr('src', 'http://upload.wikimedia.org/wikipedia/commons/2/25/Lesser_panda_standing.jpg').addClass('panda'))

var mouseShift = $( "body" ).mousemove(function( event ) {
  var pageCoords = "( " + event.pageX + ", " + event.pageY + " )";

  $( 'h1').text(pageCoords);
  $( '.cat' ).css("margin-left", event.pageX/6).css('margin-top', event.pageY/6);
  $( '.dog' ).css("margin-left", event.pageX/12).css('margin-top', event.pageY/12);
  $( '.panda' ).css("margin-left", event.pageX/8).css('margin-top', event.pageY/8);
  $('body').css("background-color", 'rgba('+(event.pageX/3) + ',' + (event.pageY/3) + ',' + ((event.pageX+event.pageY)/3) + ', .' + event.pageX + ')');

});


$( "img" ).on( "click", function(e) {
  e.stopPropagation();
  $( this ).toggleClass("blue-border");
});

$("body").on('click', function(){
  $('body').off('mousemove')
});
