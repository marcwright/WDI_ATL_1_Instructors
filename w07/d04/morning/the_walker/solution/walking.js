var leftBorder = 400;
var rightBorder = 700;

var walkingLeft = true;
var xPos = rightBorder;

var walk = function() {
  var img = document.getElementById('img');

  // walk 5 pixPosel
  walkingLeft ? xPos -= 5 : xPos += 5;
  img.style.left = xPos + "px";

  // Turn around if when you've crossed hit the border
  if (xPos > rightBorder || xPos < leftBorder) {
    img.classList.toggle("flip-img");
    walkingLeft = !walkingLeft;
  }

};

setInterval(walk, 100);

var img = document.getElementById('img');
img.addEventListener('click', function(){
  img.classList.toggle("flip-img");
  walkingLeft = !walkingLeft;
});
