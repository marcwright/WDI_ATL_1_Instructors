var leftBorder = 400;
var rightBorder = 700;

var theWalker = document.getElementById("img");


// Have the stick figure start at the right border and start walking left

theWalker.style.left = rightBorder + "px";

var timerID = setInterval(function () {
  theWalker.style.left =
}, 5000)

// When he crosses the left border, have him turn around and start walking right (and vice versa)
// NOTE: there is a pre-written class for changing the gif's direction in style.css

// Bonus: Make him turn around when you click on him
