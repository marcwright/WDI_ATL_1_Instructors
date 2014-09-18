var leftBorder = 400;
var rightBorder = 700;

var theWalker = document.getElementById("img");

window.requestAnimationFrame = window.requestAnimationFrame || window.mozRequestAnimationFrame ||
                              window.webkitRequestAnimationFrame || window.msRequestAnimationFrame;

var start = null;

function step(timestamp) {
  var progress;
  if (start === null) start = timestamp;
  progress = timestamp - start;
  theWalker.style.left = Math.min(progress/10, 1000) + "px";
  if (progress < 500000) {
    requestAnimationFrame(step);
  }
}

requestAnimationFrame(step);




// Have the stick figure start at the right border and start walking left
// When he crosses the left border, have him turn around and start walking right (and vice versa)
// NOTE: there is a pre-written class for changing the gif's direction in style.css

// Bonus: Make him turn around when you click on him
