/*
* @Author: Richard Hessler
* @Date:   2014-06-04 11:29:20
* @Last Modified by:   Richard Hessler
* @Last Modified time: 2014-06-04 16:13:43
*/


// Logs all of the good guys
function logGoodGuys(){
  console.log('Here are the good guys:');
  var goodGuys = document.getElementById('good-guy-list').children;
  for(var i = 0; i < goodGuys.length; i++){
    console.log(goodGuys[i].textContent)
  }
}

logGoodGuys();


// Change Wolverine to Logan
function loganize() {
  var wolverine = document.getElementById('good-guy-list').children[1]
  wolverine.textContent = 'Logan';
  console.log(wolverine.textContent)
}
loganize();

// Change Storm
function addColorToStorm() {
  var storm = document.getElementById('good-guy-list').children[3];
  storm.style.color = 'white';
  storm.style.background = 'blue';
}
addColorToStorm();

// Change Magneto
function addColorToMagneto() {
  var mag = document.getElementById('bad-guy-list').children[0];
  mag.style.color = 'red';
  mag.style.background = 'purple';
}
addColorToMagneto();


// Add the big class to the title

function bigTitle() {
  var title = document.querySelector('h1');
  title.classList.toggle('big');
}

bigTitle();


// Give a tag name and font, change the font
function changeTagFont(tagName, fontFamily){
  //gets all instances of tag
  var elems = document.getElementsByTagName(tagName);
  //iterate over them
  for(var i = 0; i < elems.length; i++) {
    elems[i].style.fontFamily = fontFamily;
  }
}

changeTagFont('h2', 'Lobster Two');


// All mutants have superpowers

function addSuperPowersToMutants() {
  var mutants = document.querySelectorAll('.mutant');
  for (var i = 0; i < mutants.length; i++){
     mutants[i].innerHTML += ' has super poops!';
   }
}
addSuperPowersToMutants();

//Add Gambit to the good guy list
function addGambit(){
  var goodGuys = document.querySelector('#good-guy-list');
  var gambit = document.createElement('li');
  gambit.classList.add('mutant-cajun');
  gambit.textContent = 'Gambit';
  goodGuys.appendChild(gambit);
}
function removeGambit(){
  var gambit = textContent('Gambit');
  goodGuys.removeChild(gambit);
}

//Add Mystique to good guys from bad guys

function changeOfHeart (){
  var mystique = document.getElementById('bad-guy-list').children[1];
  var goodGuyList = document.getElementById('good-guy-list');
  goodGuyList.appendChild(mystique);
}

//Remove Stryker
function removeStryker(){
  var stryker = document.getElementById('stryker');
  stryker.parentNode.removeChild(stryker);
}


//////////////////////////////////
/////////Events
///////////////////////////////////

function clicker() {
  var button = document.getElementById('button');
  button.addEventListener('click', function(){
    alert('click');
  })
}
clicker();

function clickProfessorX() {
  var x = document.getElementById('x');
  x.addEventListener('click', addGambit);
}
clickProfessorX();

function colorize() {
  var form = document.getElementById('paint');
  form.addEventListener('submit', function(e) {
    e.preventDefault();
    var color = document.getElementById('input').value;
    document.body.style.backgroundColor=color;
  })
}
colorize();
