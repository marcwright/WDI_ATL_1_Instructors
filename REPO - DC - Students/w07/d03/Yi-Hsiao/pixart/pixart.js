(function() {
  // change brush color to color put in form field
  var form = document.getElementsByTagName( "form" )[0];
  var brushes = document.querySelectorAll(".brush");

  form.addEventListener( "submit", function( e ) {
    e.preventDefault();  // prevent form from reloading page
    var desiredColor = document.getElementById( "color-field" ).value;

    // save the last 3 colors
    brushes[2].style.background = brushes[1].style.background;
    brushes[1].style.background = brushes[0].style.background;
    brushes[0].style.background = desiredColor;

    // set the first brush as the active brush
    brushes[0].classList.add( "active" );
    brushes[1].classList.remove( "active" );
    brushes[2].classList.remove( "active" );
  });

  // change active color to the one the user selects
  for ( var i = 0; i < brushes.length; i++ ) {
    brushes[i].addEventListener( "click", setColor );
  }

  // create 8000 pixels that we can paint
  for ( var i = 0; i < 8000; i++ ) {
    var square = document.createElement( "div" );
    square.classList.add( "square" );
    document.body.appendChild( square );

    // change style of square
    square.style.height = "10px";
    square.style.width = "10px";
    square.style.margin = 0;

    // add click listener so that the square is turned green when it is clicked;
    square.addEventListener( "mouseover", paintElement );
  }

  // toggle color based on what user clicks
  function setColor() {
    // reset active colors
    var brushes = document.querySelectorAll(".brush");
    for ( var i = 0; i < brushes.length; i++ ) {
      brushes[i].classList.remove( "active" );
    }

    // add active color flag to the element that was clicked
    this.classList.add( "active" );
  }

  // paint element background with the active brush's color
  function paintElement() {
    var brush = document.querySelector(".active");
    this.style.background = brush.style.background;
  }
})();