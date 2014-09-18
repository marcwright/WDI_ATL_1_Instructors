function repeatafterme(keyEvent) {
  if ((keyEvent.keyCode >= 65) && (keyEvent.keyCode <= 90)) {
    alert("You pressed: " + String.fromCharCode(keyEvent.keyCode));
  }
}

function losefocus() {
  console.log("I'm losing focus!");
  document.getElementById("answer").blur();
}

function checkform() {
  alert("Wrong answer!");
}

function greeting() {
  alert("Hello You");
}

function clickme() {
  alert("You clicked me");
}

function eek() {
  var x = document.getElementById("test");
  x.style.position = "absolute";
  x.style.color = "red";
  x.style.left = Math.floor(Math.random() * 800) + 'px';
  x.style.top = Math.floor(Math.random() * 500) + 'px';
}

function no() {
  console.log("You're out!");
}

window.onload = greeting;
window.onkeydown = repeatafterme;
