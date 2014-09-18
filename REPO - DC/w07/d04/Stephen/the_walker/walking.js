var leftBorder = 100;
var rightBorder = 1000;


var theWalker = document.getElementById("img");

theWalker.classList.toggle( 'flip-img' );

// Have the stick figure start at the right border and start walking left
// When he crosses the left border, have him turn around and start walking right (and vice versa)
// NOTE: there is a pre-written class for changing the gif's direction in style.css

var xPos = leftBorder;

// set initial y position
var yPos = 0;
theWalker.style.top = '0px';

var walkingRight = false;
var timerID = setInterval( walk, 1 );

function walk() {
  if ( xPos < leftBorder || xPos > rightBorder ) reverse();
  walkingRight ? xPos++ : xPos--;
  theWalker.style.left = xPos + 'px';

  // move down the screen
  yPos += 0.1;
  theWalker.style.top = yPos + 'px';
}

function reverse() {
  walkingRight = !walkingRight;
  theWalker.classList.toggle( 'flip-img' );
}

theWalker.addEventListener( 'click', reverse );

// Bonus: Make him turn around when you click on him
