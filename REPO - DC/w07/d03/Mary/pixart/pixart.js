function setColor() {
  var form = document.getElementById('set-color')
  form.addEventListener('submit', function(event) {
    event.preventDefault();
    var color = document.getElementById('color-field').value;
    document.querySelector('.brush').style.backgroundColor = color;
  });
}
setColor();

function createSquares() {
  for (var i = 0; i < 8000; i++) {
    var square = document.createElement('div');
    document.body.appendChild(square);
    square.classList.add('square');
  }
}
createSquares();

// function colorizeSquaresToGreen() {
//   squares = document.querySelectorAll('.square')
//   for (var i = 0; i < squares.length; i++) {
//     squares[i].addEventListener('click', function() {
//       this.style.backgroundColor = 'green'
//     });
//   };
// }
// colorizeSquaresToGreen();

function colorizeSquaresToInput() {
  squares = document.querySelectorAll('.square');
  for (var i = 0; i < squares.length; i++) {
    squares[i].addEventListener('mouseover', function() {
      var color = document.getElementById('color-field').value || 'blue';
      this.style.backgroundColor = color;
    });
  };
}
colorizeSquaresToInput();

