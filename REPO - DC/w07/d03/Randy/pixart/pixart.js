brush = document.querySelector('.brush');

function setColor(){
  var colorButton = document.getElementById('set-color');
  colorButton.addEventListener('click', function(event){
    event.preventDefault();
    var fieldColor = document.getElementById('color-field');
    var fieldColorValue = fieldColor.value;
    var brushBox = document.querySelectorAll('div')[1];
    brushBox.style.backgroundColor = fieldColorValue;
  });
}
setColor();

function createDivs(){
  for (i = 0; i < 20000; i++){
    var div = document.createElement('div');
      div.setAttribute('class', 'square');
      div.addEventListener('mouseover', function(){
      this.style.backgroundColor = brush.style.backgroundColor;
    });
      document.body.appendChild(div);
      }
}
createDivs();


