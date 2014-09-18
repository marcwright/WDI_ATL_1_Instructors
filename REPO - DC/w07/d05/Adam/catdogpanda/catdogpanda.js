// STEP 1
// Create a cat image with a class of "cat" and add it to the body.
$( "body" ).append( "<img class='cat' src='http://www.mojowallpapers.com/wp-content/uploads/2013/11/Cat-Wallpaper-17.jpg'>" );
// Create a dog image with a class of "dog" and add it to the body.
$( "body" ).append( "<img class='dog' src='http://rack.3.mshcdn.com/media/ZgkyMDE0LzA0LzA0LzVkL21pbGV5ZG9nLmEzMDVjLmpwZwpwCXRodW1iCTk1MHg1MzQjCmUJanBn/f090e19b/ade/miley-dog.jpg'>" );
// Create a panda image with a class of "panda" and add it to the body.
$( "body" ).append( "<img class='panda' src='http://images6.fanpop.com/image/photos/34900000/Cute-Panda-Bears-animals-34915025-2560-1600.jpg'>");

// STEP 2
// When the mouse moves within the body, console.log the x and y coordinates. [The docs on mousemove](http://api.jquery.com/mousemove/) may be helpful here.
$( "body" ).mousemove(function( event ) {
  var msg = "Handler for .mousemove() called at ";
  msg += event.pageX + ", " + event.pageY;
  console.log( msg );
});

// STEP 3
// Instead of using console.log, replace the text of the h1 with the current coordinates of the mouse.
$( 'body' ).mousemove(function( event ) {
  var msg2 = "Handler for .mousemove() called at ";
  msg2 += event.pageX + ", " + event.pageY;
  $( 'h1' ).text( msg2 );
});

// STEP 4
// When the mouse moves, change the css of each of your images so that the margin-left and margin-top change along with the x and y coordinates of your mouse. [Read the docs on css](http://api.jquery.com/css/). Try dividing the x and y coordinates by a factor (anywhere from 6 - 20) before setting your margin, and make this factor different for each image.

$( 'body' ).mousemove(function() {
  var xMove = event.pageX
  var yMove = event.pageY
})
