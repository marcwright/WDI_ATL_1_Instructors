var leftBorder = 400;
var rightBorder = 700;

var theWalker = document.getElementById("img");
var xPosition = rightBorder;

theWalker.style.left = rightBorder + "px";

function walk(){
	xPosition = walkingLeft ? xPosition - 10 : xPosition + 10; 
	theWalker.style.left = xPosition + "px";
	if (xPosition === leftBorder ) {
		theWalker.classList.toggle("flip-img");
		walkingLeft = false; 
	}
}


var timerID = setInterval(walk, 250);

// (function(){ 
// 	xPosition = xPosition - 10;
// 	theWalker.style.left = xPosition + "px";
// 	if (xPosition === leftBorder){
// 	theWalker.classList.toggle("flip-img");
// 	}


// Have the stick figure start at the right border and start walking left
// When he crosses the left border, have him turn around and start walking right (and vice versa)
// NOTE: there is a pre-written class for changing the gif's direction in style.css

// Bonus: Make him turn around when you click on him
