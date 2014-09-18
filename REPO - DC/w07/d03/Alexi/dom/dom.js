// Log all of the good guys

function logGoodGuys(){
  console.log('Here are the good guys:');
  var goodGuys = document.getElementById('good-guy-list').children;
  for(var i = 0; i < goodGuys.length; i++){
    console.log(goodGuys[i].textContent)
  }
}
logGoodGuys();

// Change Wolverine to Logan
function loganize(){
  var wolverine = document.getElementById('good-guy-list').children[1];
  wolverine.textContent = 'Logan';
}
loganize();

//Change Storm

function addColorToStorm(){
  var storm = document.getElementById('good-guy-list').children[3];
  storm.style.color = 'white';
  storm.style.background = 'black';
}
addColorToStorm();

// Change Magneto to red on purple background
function addColorToMagneto(){
  var magneto = document.getElementById('bad-guy-list').children[0];
  magneto.style.color = 'red';
  magneto.style.background = 'purple';
}
addColorToMagneto();

// Add Big class to the title
function bigTitle() {
  var title = document.querySelector('h1');
  title.classList.toggle('big');
}

// Given a tag name and font, change the font
function changeTagFont(tagName, fontFamily){
  // get all instances of a tag
  var elems = document.getElementsByTagName(tagName);
  // iterate over the array of nodes
  for (var i = 0; i< elems.length; i++){
    elems[i].style.fontFamily = fontFamily;
  }
}
changeTagFont('h1', 'Lobster Two');

// All mutants have superpowers
function  addSuperPowersToMutants() {
  var mutants = document.querySelectorAll('.mutant');
  for (var i = 0; i < mutants.length; i++)
    mutants[i].innerHTML += ' has super powers!';
}
addSuperPowersToMutants();

// Add Gambit to the good guy list

function addGambit() {
  var goodGuys = document.querySelector('#good-guy-list');
  var gambit = document.createElement('li');
  gambit.classList.add('mutant');
  gambit.textContent = 'Gambit';
  goodGuys.appendChild(gambit);
}

// Move Mystique from bad guys to good guys
function changeOfHeart(){
  var mystique = document.getElementById('bad-guy-list').children[1];
  goodGuyList = document.getElementById('good-guy-list');
  goodGuyList.appendChild(mystique);
}
changeOfHeart();

// Remove Stryker
// function removeStryker(){
//   //
// }

//=========EVENTS===========//

function clicker() {
  var button = document.getElementById('button');
  button.addEventListener('click', function() {
    alert('click!');
  });
}
clicker();

function clickProfessorX() {
  var profX = document.getElementById('x');
  profX.addEventListener('click', addGambit);
}
clickProfessorX();

function colorize(){
  var form = document.getElementById('paint');
  form.addEventListener('submit', function(event){
    event.preventDefault();
    var color = document.getElementById('input').value;
    document.body.style.backgroundColor = color;
  });
}
colorize();
