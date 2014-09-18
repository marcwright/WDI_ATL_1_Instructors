var $body = $( "body" );  // to determine the width and height of body
var $empty = $( ".empty" );  // filled-in images
var $drag = $( ".drag" );  // filled-in images

$empty.each(function() {
  $emptyImage = $( this );

  // randomize image position
  $emptyImage.css({
    // keep the empty images within the body
    left: Math.random() * ( $body.width() - $emptyImage.width() ),
    // keep the empty images below the filled images but within the body
    top: Math.random() * ( $body.height() - $emptyImage.height() - 200 ) + 200
  });
});

$drag.on( "mousedown", function( event ) {
  event.preventDefault();
  $draggedItem = $( this );

  $body
    .on( "mousemove", function( event ) {
      event.preventDefault();
      $draggedItem.css({
        left: event.pageX - $draggedItem.width() / 2,
        top: event.pageY - $draggedItem.height() / 2
      });
    })
    .on( "mouseup", function() {
      $body.off( "mousemove mouseup" );
      drop( $draggedItem );
    });
});

function drop( el ) {
  var $positiveImage = $( el );

  var animalClass = $positiveImage.attr( "class" ).replace( "drag ", "" );
  var $negativeImage = $( ".empty." + animalClass );

  var negativePosition = $negativeImage.position();
  var distance = getDistance( $positiveImage.position(), negativePosition );

  // snap object together, if they are within 50 pixels of each other
  if ( distance < 50 ) {
    $positiveImage.css( negativePosition );
  }
}

// get distance between two points
function getDistance( pos1, pos2 ) {
  var a = pos2.left - pos1.left;
  var b = pos2.top - pos1.top;

  return Math.sqrt( a * a + b * b );
}