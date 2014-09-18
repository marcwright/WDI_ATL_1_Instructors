Code Along

Grow and fade out the Google logo on Google.com.

var img = document.getElementById('hplogo');


Write a grow function to animate the logo:


function grow(){img.width += 2;}
var timer = setInterval(grow, 20);
clearInterval(timer);


Write a function to fadeOut the logo:


img.style.opacity = 1;
function fadeOut(){img.style.opacity -= 0.01;}
var timer = setInterval(fadeOut, 20);

