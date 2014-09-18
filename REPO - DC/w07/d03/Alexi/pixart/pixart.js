

var form = document.getElementById('form');
var input = document.querySelector('#color-field');
var brush = document.querySelector('.brush');

form.addEventListener('submit', function(event){
  event.preventDefault();
  brush.style.backgroundColor = input.value;
});

for (var i = 0; i < 20; i++){
  var div = document.createElement('div');
  div.classList.add('square');
  div.addEventListener('click', function(){
    this.style.backgroundColor = 'green';
  });

  document.body.appendChild(div);
}
