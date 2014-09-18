var leftBorder = 400;
var rightBorder = 700;

var theWalker = document.getElementById( "img" );


// Have the stick figure start at the right border and start walking left
// When he crosses the left border, have him turn around and start walking right (and vice versa)
// NOTE: there is a pre-written class for changing the gif's direction in style.css

var xPos = rightBorder;
theWalker.style.left = xPos + "px";
setInterval( walk, 500 );

// Bonus: Make him turn around when you click on him

var walkLeft = true;
function walk() {
  var stepSize = 20;
  xPos = walkLeft ? xPos - stepSize : xPos + stepSize;
  theWalker.style.left = xPos + "px";

  if ( xPos <= leftBorder && walkLeft || xPos >= rightBorder && !walkLeft ) {
    theWalker.classList.toggle( "flip-img" );
    walkLeft = !walkLeft;
  }
}