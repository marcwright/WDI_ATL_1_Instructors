function init() {
  stand();
  blanka.style.left = "0px";
  var ball = document.getElementById("ball");
  ball.style.left = window.innerWidth - 300 + 'px';
  ball.addEventListener("click", moveball);
}

function moveball() {
  blanka.className = "crouch";
  var sfx = new Audio('sound/A00304.ogg'); // from http://www.bolzplatz2006.de/
  intervalID = setInterval(function() {
    if (ball.style.left == "0px") {
      window.clearInterval(intervalID);
      sfx.play();
      alert('GOAL!');
    } else {
        ball.style.left = parseInt(ball.style.left) - 1 + 'px';
    }
  }, 1);
}

function stand() {
  // make blanka famous and accessible!
  var blanka = document.getElementById("blanka");
  blanka.className = "stand";
}

function move_that_beast(keyEvent) {
  console.log("Blanka likes to move it");

  switch(keyEvent.keyCode) {
    case 39: // -> arrow
      blanka.className = "walk";
      blanka.style.left = parseInt(blanka.style.left) + 8 + 'px';
      break;
    case 37: // <- arrow
      blanka.className = "walk";
      blanka.style.left = parseInt(blanka.style.left) - 8 + 'px';
      break;
    default:
      blanka.classList.remove("stand");
      console.log(keyEvent.keyCode);
  }
}


window.onload = init;
window.onkeydown = move_that_beast;
window.onkeyup = stand;
