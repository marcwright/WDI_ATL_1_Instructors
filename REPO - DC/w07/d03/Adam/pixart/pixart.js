var form = document.getElementById('form');
var input = document.querySelector('#color-field');
var brush = document.querySelector('.brush');

form.addEventListener('submit', function(event) {
  event.preventDefault();
  brush.style.backgroundColor = input.value;

});

