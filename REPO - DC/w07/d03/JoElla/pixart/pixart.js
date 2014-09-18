// * When I click the "Set Color" button, it should change the color of the "brush" box to the color I specify in the input field.
// * The same thing should happen when I press the enter key from inside the input field
function setColor(){
  var form = document.querySelector('form');
  form.addEventListener('submit', function(event){
    event.preventDefault();
    var color = document.getElementById('color-field').value;
    var brush = document.getElementsByClassName('brush')[0];
    brush.style.backgroundColor = color;
  });
}
setColor();
// * Using JavaScript, create 20 divs of the "square" class and append them to the body
function makeSquares(){
  for (var i = 0; i <= 8000; i++){
    var square = document.createElement('div');
    square.className = 'square';
    body = document.querySelector('body');
    body.appendChild(square);
  }
}
makeSquares();
// //* Add functionality so that when I click on each "square", it changes the color of that individual square to "green


function colorSquares(){
  var square = document.getElementsByClassName('square');
  for (var i = 0; i <= 8000; i++){
    square[i].addEventListener('mouseover', function(){
      var color = document.getElementById('color-field').value;
      this.style.backgroundColor = color;
    });
  }
}

colorSquares();
