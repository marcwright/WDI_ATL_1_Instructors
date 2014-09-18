//Logs all of the good guys

function logGoodGuys(){
  console.log('Here are the good guys:');
  var goodGuys = document.getElementById('good-guy-list').children;
  for(var i = 0; i< goodGuys.length; i++){
    console.log(goodGuys[i].textContent)
  }
}

function loganize(){
  var wolverine = document.getElementById('good-guy-list').children[1];
  wolverine.textContent = 'Logan';
}
loganize();

function addColorToStorm(){
  var storm = document.getElementById('good-guy-list').children[3];
  storm.style.color = 'white';
  storm.style.background = 'black';
}
addColorToStorm();

function addColorToMagneto(){
  var magneto = document.getElementById('bad-guy-list').children[0];
  magneto.style.color = 'red';
  magneto.style.background = 'purple';
}
addColorToMagneto();

// Add the big class to the title.
function bigTitle(){
  var title = document.querySelector('h1');
  title.classList.toggle('big');
}
bigTitle();

//Given a tag name and font, change the font.
function changeTagFont(tagName, fontFamily){
  //get all instances of a tag
  var elems = document.getElementsByTagName(tagName);
  //iterate over them
  for (var i = 0; i < elems.length; i++){
    elems[i].style.fontFamily = fontFamily;
  }
}
changeTagFont('h1', 'Lobster Two');

//All mutants have superpowers.
function addSuperPowersToMutants(){
  var mutants = document.querySelectorAll('.mutant');
  for (var i = 0; i < mutants.length; i++){
    mutants[i].innerHTML += ' has super powers!';
  }
}
addSuperPowersToMutants();

function addGambit(){
  var goodGuys = document.querySelector('#good-guy-list');
  var gambit = document.createElement('li');
  gambit.classList.add('mutant');
  gambit.textContent = 'Gambit';
  goodGuys.appendChild(gambit);
}

//Move Mystique from bad guys to good guys
function changeOfHeart(){
  var mystique = document.getElementById('bad-guy-list').children[1];
  var goodGuyList = document.getElementById('good-guy-list');
  goodGuyList.appendChild(mystique);
}
changeOfHeart();

// Remove Stryker
function removeStryker(){
  var stryker = document.getElementById('stryker');
  stryker.parentNode.removeChild(stryker);
}
removeStryker();

////////////
//events
////////////
function clicker(){
  var button = document.getElementById('button');
  button.addEventListener('click', function(){
    alert('click!');
  });
}
clicker();

function clickProfessorX(){
  var x = document.getElementById('x');
  x.addEventListener('click', addGambit);
}
clickProfessorX();

function colorize(){
  var form = document.getElementById('paint');
  form.addEventListener('submit', function(e){
    console.log(event);
    e.preventDefault();
    var color = document.getElementById('input').value;
    document.body.style.backgroundColor = color;
  })
}
colorize();
