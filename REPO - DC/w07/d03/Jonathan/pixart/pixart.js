// Commit 1
// When I click the "Set Color" button, it should change the color of the "brush" box to the color I specify in the input field.

function changeColor() {
  var form = document.getElementById('form');
  var input = document.querySelector('#color-field');
  var brush = document.querySelector('.brush');

  form.addEventListener('submit', function(event) {
    event.preventDefault();
    brush.style.backgroundColor = input.value;
  });
}
changeColor();

// Commit 2
// The same thing should happen when I press the enter key from inside the input field



// Commit 3
// Using JavaScript, create 20 divs of the "square" class and append them to the body

for var( i = 0; i < 20; i++) {
  var div = document.createElement('div');
  div.classList.add('square');
  document.body.appendChild(div);
}

// Commit 4
// Add functionality so that when I click on each "square", it changes the color of that individual square to "green"



// Commit 5
// Modify your code so that when I click on each "square", it changes to the color I set using my input instead of "green" every time.



// Commit 6
// Modify the CSS so that the "square" class has a height and width of 10px and a margin of 0.



// Modify your code so that you are creating 8000 divs instead of 20.



// Change the event that changes your box colors from 'click' to 'mouseover'



// Paint a picture!
