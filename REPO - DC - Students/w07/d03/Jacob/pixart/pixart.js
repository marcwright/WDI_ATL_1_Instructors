//Commit One and Two: Set Color
function setColor() {
  var colorButton = document.getElementById('form');
  colorButton.addEventListener('submit', function(event) {
    event.preventDefault ();
    var color = document.getElementById('color-field').value;
    var box = document.querySelector('.brush');
    box.style.backgroundColor = color;
  });
}
setColor();

//Commit Three: 20 Divs of Square Class
function createSquares() {
  for (var i = 0; i < 20; i++) {
    var square = document.createElement('div');
    square.setAttribute('class', 'square');
    document.body.appendChild(square);
  }
}
createSquares();
