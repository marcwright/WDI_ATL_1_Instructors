function colorize() {
  var form = document.getElementById('form');
  form.addEventListener('submit', function(event) {
    event.preventDefault();
    // console.log(event);
    var color = document.getElementById('color-field').value;
    document.querySelector('.brush').style.backgroundColor = color;
  });
}
colorize();

function makeSquares() {
  for (var i = 0; i < 8000; i++) {
    square = document.createElement('div');
    square.classList.add('square');
    document.body.appendChild(square);
  }
}
makeSquares();

function colorSquares() {
  var allSquares = document.querySelectorAll('.square');
  for (var i = 0; i < 8000; i++) {
    var eachSquare = allSquares[i];
    eachSquare.addEventListener('mouseover', function(){
      var color = document.querySelector('.brush').style.backgroundColor || 'navy';
      this.style.backgroundColor = color;
    });
  };
}
colorSquares();

function modifySquare() {
  var allSquares = document.querySelectorAll('.square');
  for (var i = 0; i < 8000; i++) {
    var eachSquare = allSquares[i];
    eachSquare.style.height = '10px';
    eachSquare.style.width = '10px';
    eachSquare.style.margin = '0px';
  };

}
modifySquare();
