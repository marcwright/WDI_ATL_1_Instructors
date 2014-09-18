/*
* @Author: stephenstanwood
* @Date:   2014-06-09 09:26:54
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-06-09 11:04:39
*/

$body = $( 'body' );

$( '.empty' ).each( function() {
  var $empty = $( this );

  $( this ).css( {
    top: Math.random() * ( $body.height() - $empty.height() - 200) + 200,
    left: Math.random() * ( $body.width() - $empty.width() )
  });
});

$( '.drag' ).on( 'mousedown', function( e ) {
  e.preventDefault();
  var $dragger = $( this );
  var $doc = $( document );

  $doc
    .on( 'mousemove', function( e ) {
      e.preventDefault();
      $dragger.css({
        top: e.pageY - ( $dragger.height() / 2 ),
        left: e.pageX - ( $dragger.width() / 2 )
      });
    })
    .on( 'mouseup', function( e ) {
      $doc.off( 'mousemove mouseup');
      drop( $dragger );
    });
});

function drop ( elem ) {
  var $elem = $( elem );
  var className = $elem.attr( 'class' ).replace('drag ', '');
  var $negative = $( '.empty' + '.' + className );

  var negPos = $negative.position();
  var posPos = $elem.position();

  if ( distance(negPos, posPos) < 100 ) {
    $elem.animate(negPos);
  }
}

function distance( p1, p2) {
  var a = p2.left - p1.left;
  var b = p2.top - p1.top;
  return Math.sqrt( a * a - b * b );
}
