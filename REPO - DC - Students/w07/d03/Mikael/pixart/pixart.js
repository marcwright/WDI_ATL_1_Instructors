
// * When I click the "Set Color" button, it should change the color of the "brush" box to the color I specify in the input field.


var form = document.getElementById('form');
var color = document.querySelector('#color-field');
var brush = document.querySelector('.brush');

form.addEventListener('submit', function(event){
    event.preventDefault();
  brush.style.backgroundColor = color.value;
});

// * Using JavaScript, create 20 divs of the "square" class and append them to the body

for (var i = 0; i <= 20; i++) {
  var div = document.createElement('div');
  div.classList.add('square');
  document.body.appendChild(div);
}
