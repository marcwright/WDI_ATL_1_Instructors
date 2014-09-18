var leftBorder = 400;
var rightBorder = 700;

var theWalker = document.getElementById("img");
var xPosition = rightBorder;

// Have the stick figure start at the right border and start walking left
theWalker.style.left = rightBorder + "px"
var walkingLeft = true;

function walk() {
  xPosition = walkingLeft ? xPosition - 10 : xPosition + 10;
  theWalker.style.left = xPosition + "px";
  if (xPosition < leftBorder || xPosition > rightBorder) {
    theWalker.classList.toggle("flip-img");
    walkingLeft = !walkingLeft;
  }
}

theWalker.addEventListener("click", function() {
  walkingLeft = !walkingLeft
  theWalker.classList.toggle("flip-img")
});

var timerID = setInterval(walk, 100);

// When he crosses the left border, have him turn around and start walking right (and vice versa)
// NOTE: there is a pre-written class for changing the gif's direction in style.css
// if (xPosition === leftBorder) {
//   theWalker.classList.toggle("flip-img");
//   xPosition += 10;
//   theWalker.style.left = xPosition + "px";
// }


// Bonus: Make him turn around when you click on him
