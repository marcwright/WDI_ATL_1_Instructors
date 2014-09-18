$(function() {

  function addImage( source, classTag ) {
    var image = document.createElement("img");
    image.src = source;  
    image.classList.add( classTag );
    $("body").append( image );
  }

  // track mouse position and move images according to mouse position
  function moveImages( event ) {
    // print out coordinates
    var $coords = $( "#coords" );
    $coords.text( "Coordinates: " + event.pageX + ", " + event.pageY );

    // moves the images as the cursor moves
    // based on how far the cursor has moved
    $( "img" ).each(function() {
      $( this ).css({
        // adjust margin so it doesn't fly off from the center of the page
        "margin-left": event.pageX/4,
        "margin-top": event.pageY/4
      });
    });
  }

  // add cat, dog, panda images
  addImage( "http://upload.wikimedia.org/wikipedia/commons/2/22/Turkish_Van_Cat.jpg", "cat" );
  addImage( "http://davidfeldmanshow.com/wp-content/uploads/2014/01/dogs-wallpaper.jpg", "dog" );
  addImage( "http://upload.wikimedia.org/wikipedia/commons/0/0f/Grosser_Panda.JPG", "panda" );

  $( "body" ).on( "mousemove", moveImages );

  // toggles border class if a user clicks an iamge
  $( "img" ).on( "click", function() {
    event.stopPropagation();
    $( this ).toggleClass( "blue-border" );
  });

  // stop coordinate tracking if you click the body
  $( "body" ).on( "click", function( event ) {
    $( this ).off( "mousemove" );
  });
});