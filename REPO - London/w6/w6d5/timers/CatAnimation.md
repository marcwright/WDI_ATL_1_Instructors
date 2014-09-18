http://www.teaching-materials.org/javascript/exercises/animation.html



#The Cat Walk

Who needs Milan when you have JavaScript?

Start with this webpage, which has a single img tag of an animated GIF of a cat walking.

  <!DOCTYPE html>
  <html>
   <head>
    <meta charset="utf-8" />
    <title>Cat Walk</title>
   </head>
   <body>

    <img style="position:absolute;" src="http://www.anniemation.com/clip_art/images/cat-walk.gif">

   </body>
  </html>

- Add a script tag at the bottom of the page, where you'll put all your code.
- Create a variable to store a reference to the img.
- Change the style of the img to have a "left" of "0px", so that it starts at the left hand of the screens.
- Create a function called catWalk() that moves the cat 10 pixels to the right of where it started, by changing the "left" style property.
- Call that function every 50 milliseconds. Your cat should now be moving across the screen from left to right. Hurrah!

#Solution

```
var img = document.getElementsByTagName('img')[0];
img.style.left = '0px';
function catWalk() {
  img.style.left = (parseInt(img.style.left) + 10) + 'px';
}
window.setInterval(catWalk, 50);
```

Bonus #1: When the cat reaches the right-hand of the screen, restart them at the left hand side ("0px"). So they should keep walking from left to right across the screen, forever and ever.

#Solution
```
var img = document.getElementsByTagName('img')[0];
img.style.left = '0px';
function catWalk() {
  var currentLeft = parseInt(img.style.left);
  img.style.left = (currentLeft + 10) + 'px';
  if (currentLeft > (window.innerWidth-img.width)) {
    img.style.left = '0px';
  }
  // if (currentLeft > (window.innerWidth)) { // make the cat go off the screen to avoid 'jankiness'
  //  img.style.left = '-'+img.width+'px';
  // }
}
window.setInterval(catWalk, 50);
```

Bonus #2: When the cat reaches the right-hand of the screen, make them move backwards instead. They should keep walking back and forth forever and ever.

#Solution

```
var img = document.getElementsByTagName('img')[0];
img.style.left = '0px';
var walkForwards = true;
function catWalk() {
  var currentLeft = parseInt(img.style.left);

  if (walkForwards && (currentLeft > (window.innerWidth-img.width))) {
    walkForwards = false;
  }
  if (!walkForwards && (currentLeft <= 0)) {
    walkForwards = true;
  }

  if (walkForwards) {
    img.style.left = (currentLeft + 10) + 'px';
  } else {
    img.style.left = (currentLeft - 10) + 'px';
  }
}
window.setInterval(catWalk, 50);
```

Bonus #3: Something else? 
  - When the cat reaches the middle of the screen, replace the img with an image of a cat dancing, keep it dancing for 10 seconds, and then replace the img with the original image and have it continue the walk.
  - Move the cat around by capturing keypress events.

```
var img = document.getElementsByTagName('img')[0];
img.style.left = '0px';
img.style.opacity = 1;

function catWalk() {
  var currentLeft = parseInt(img.style.left);
  img.style.left = (currentLeft + 10) + 'px';
  if (currentLeft > (window.innerWidth)) {
    img.style.left = '-'+img.width+'px';
  }
}

var fadeDirection = "out";

function fadeCat(){
  if(fadeDirection == 'out') {
    if (img.style.opacity <= 0.01) {
      fadeDirection = 'in';
    }
  } else {
    if (img.style.opacity >= 0.99) {
      fadeDirection = 'out';
    }
  } 

  if(fadeDirection == 'out') {
    img.style.opacity -= 0.01;
  } else {
    img.style.opacity = parseFloat(img.style.opacity) + 0.01;
  }
}

var myCatFade = setInterval(fadeCat, 50);

var myCatWalk = window.setInterval(catWalk, 50);
```










