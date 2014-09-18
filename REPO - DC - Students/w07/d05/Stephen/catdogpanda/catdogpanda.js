/*
* @Author: stephenstanwood
* @Date:   2014-06-06 16:09:44
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-06-06 17:18:40
*/

var $body = $( 'body' );
var $coords = $( '#coords' );

var cat = $( '<img class=\'cat\' src=\'http://goo.gl/M24QU0\'>' );
$body.append( cat );

var dog = $( '<img class=\'dog\' src=\'http://goo.gl/c6UksD\'>' );
$body.append( dog );

var panda = $( '<img class=\'panda\' src=\'http://goo.gl/vZjl2L\'>' );
$body.append( panda );

var animals = [ cat, dog, panda ];
var factors = [ 10, 18, 6 ];

$( 'body' ).on( 'mousemove', function moveImage( e ) {
  var x = e.pageX;
  var y = e.pageY;

  $coords.text( x + ', ' + y );

  for ( var i = 0, len = animals.length; i < len; i++ ) {
    animals[i].css( 'margin-left', ( x / factors[i] ).toString() + 'px' );
    animals[i].css( 'margin-top', ( y / factors[i] ).toString() + 'px' );
  }
});

for ( var i = 0, len = animals.length; i < len; i++ ) {
  animals[i].on( 'click', function( e ) {
    $(this).toggleClass( 'blue-border' );
    e.stopPropagation();
  });
}

$( 'body' ).on( 'click', function() {
  $( this ).off();
});
