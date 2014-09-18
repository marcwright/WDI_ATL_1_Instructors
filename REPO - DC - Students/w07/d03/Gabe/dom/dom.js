// Logs all of the good guys
function logGoodGuys(){
  console.log('Here are the good guys:');
  var goodGuys = document.getElementById('good-guy-list').children;
  for(var i = 0; i < goodGuys.length; i++){
    console.log(goodGuys[i])
  }
}

logGoodGuys();

//change storm to colors:

function addColorToStorm() {
  var storm = document.getElementById('good-guy-list').children[3];
  storm.style.color = 'yellow';
  storm.style.background = 'blue';
}
addColorToStorm();

//change storm to colors:

function addColorToMagneto() {
  var mag = document.getElementById('bad-guy-list').children[0];
  mag.style.color = 'red';
  mag.style.background = 'purple';
}
addColorToMagneto();



//change OTHER colors!!!!:

//function addColors() {
//  var bg = document.children[0].children[1];
//  bg.style.color = 'gold';
//  bg.style.background = 'gray';

//}
//addColors();

// Given a tag name and font, change the font
function changeTagFont(tagName, fontFamily){
  // get all instances of a tag
  var elems = document.getElementsByTagName(tagName);
  // iterate over the array of nodes
  for (var i = 0; i< elems.length; i++){
    elems[i].style.fontFamily = fontFamily;
  }
}
changeTagFont('li', 'Lobster two');

// Add custom text to each elementsupers
function addSuperPowersToMutants(){
  var mutants = document.querySelectorAll('.mutant');
  for (var i = 0; i < mutants.length; i++){
    mutants[i].innerHTML += ' has super powers!';
  }
}
addSuperPowersToMutants();



/////////   EVENTS   ///////////////

function button() {
var button  = document.getElementById('button');

button.addEventListener('click', function(){ alert('The X-men!')});
}

button();


function profX() {
  var x = document.getElementById('x');
  x.addEventListener('click', logGoodGuys)
  //prints out good-guys to console.

}
profX();

function colorize() {
  form = document.getElementById('paint');
  form.addEventListener('submit', function(){
    event.preventDefault();
    var color = document.getElementById('input').value;
    document.body.style.backgroundColor = color;
  })

}
colorize();
