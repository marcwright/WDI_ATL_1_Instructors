var leftBorder = 400;
var rightBorder = 700;

var theWalker = document.getElementById("img");
var xPosition = rightBorder;


// Have the stick figure start at the right border and start walking left
theWalker.style.left = rightBorder + 'px';
var timerID = setInterval(function() {
  xPosition -= 10;
  theWalker.style.left = xPosition + 'px';
}, 250)

if (xPosition === leftBorder) {
  theWalker.classList.toggle('flip-img')
}

// When he crosses the left border, have him turn around and start walking right (and vice versa)
// NOTE: there is a pre-written class for changing the gif's direction in style.css

// Bonus: Make him turn around when you click on him
