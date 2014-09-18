var leftBorder = 700;
var rightBorder = 400;

var theWalker = document.getElementById("img");
var xPosition = leftBorder;

theWalker.style.right = leftBorder + "px";
var walkingRight = true;

function walk(){
  xPosition = walkingRight ? xPosition - 10 : xPosition + 10;
  theWalker.style.right = xPosition + "px";
  if (xPosition < rightBorder){
    theWalker.classList.toggle("flip-img");
    walkingRight = false;
  }
  if (xPosition > leftBorder) {
    theWalker.classList.toggle("flip-img");
    walkLeft = true;
  }  

  theWalker.addEventListener("click", function(){
    walkingLeft = !walkingLeft;
    theWalker.classList.toggle("flip-img");
  });
}

var timerID = setInterval(walk, 250);


// Have the stick figure start at the right border and start walking left
// When he crosses the left border, have him turn around and start walking right (and vice versa)
// NOTE: there is a pre-written class for changing the gif's direction in style.css

// Bonus: Make him turn around when you click on him
