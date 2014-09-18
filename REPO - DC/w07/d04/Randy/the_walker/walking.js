var leftBorder = 200;
var rightBorder = 1000;

var theWalker = document.getElementById("img");
var xPosition = rightBorder;


// Have the stick figure start at the right border and start walking left
// When he crosses the left border, have him turn around and start walking right (and vice versa)
// NOTE: there is a pre-written class for changing the gif's direction in style.css

// Bonus: Make him turn around when you click on him


theWalker.style.left = rightBorder + "px";
  var walkingLeft = true;

function walk(){
  xPosition = walkingLeft ? xPosition - 10 : xPosition + 10;
  theWalker.style.left = xPosition + "px";

  if (xPosition < leftBorder || xPosition > rightBorder){
    theWalker.classList.toggle('flip-img');
    walkingLeft = !walkingLeft;
  }
}
var intervalId = setInterval(walk, 100);

theWalker.addEventListener('click', function(){
  walkingLeft = !walkingLeft;
  theWalker.classList.toggle('flip-img');
});
