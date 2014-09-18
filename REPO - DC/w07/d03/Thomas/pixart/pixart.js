var color;

function colorizeBrushBox() {
  var form = document.getElementById('form');
  form.addEventListener('submit', function(event) {
    console.log(event);
    event.preventDefault();
    color = document.getElementById('color-field').value
    var brush = document.querySelector('.brush')
    brush.style.backgroundColor = color;
  });
}
colorizeBrushBox();

function colorSquare() {
  this.style.backgroundColor = color;
}

function addTwentyBoxes() {
  for (i = 0; i < 8000; i++) {
    var square = document.createElement('div');
    square.setAttribute('class', 'square');
    square.addEventListener('mouseover', colorSquare)
    document.body.appendChild(square)
  }
}
addTwentyBoxes();


