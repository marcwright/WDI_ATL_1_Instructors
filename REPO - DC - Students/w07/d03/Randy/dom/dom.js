// Logs all of the good guys
function logGoodGuys(){
  console.log('Here are the good guys:');
  var goodGuys = document.getElementById('good-guy-list').children;
  for(var i = 0; i < goodGuys.length; i++){
    console.log(goodGuys[i].textContent)
  }
}


// Change Wolverine to Logan

function loganize(){
  var wolverine = document.getElementById('good-guy-list').children[1];
  wolverine.textContent = 'Weapon-X';
}

loganize();

//Change storm

function stormStyle(){
  var storm = document.getElementById('good-guy-list').children[3];
    storm.style.backgroundColor = 'blue';
    storm.style.color = 'white';
}
stormStyle();

function magStyle(){
  var mag = document.getElementById('bad-guy-list').children[0];
    mag.style.backgroundColor = 'purple';
    mag.style.color = 'red';
}
magStyle();

// Add big calss to title.
function bigTitle(){
  var title = document.querySelector('h1');
  title.classList.toggle('big');
}
bigTitle();

// Given a tag name and font, change the font

function changeTagFont(tagName, fontFamily){
  //gets all instances of a tag
  var elems = document.getElementsByTagName(tagName);
  // Interate over elems
  for (var i = 0; i < elems.length; i++){
    elems[i].style.fontFamily = fontFamily;
  }
}
changeTagFont('h2', 'Lobster Two');

// Exclaim that mutants have superpowers!!!!!
function addSuperPowersToMutants(){
  var mutants = document.querySelectorAll('.mutant')
  for (var i = 0; i < mutants.length; i++){
    mutants[i].innerHTML += ' is a mutant, RUN!';
  }
}
addSuperPowersToMutants();

// Add gambit to good guys

function addGambit(){
  var goodGuys = document.querySelector('#good-guy-list');
  var gambit = document.createElement('li');
  gambit.textContent = "Gambit";
  gambit.classList.add('mutant');
  goodGuys.appendChild(gambit);
}

addGambit();

//Move Mystique from bad guys to good guys

function changeOfHeart(){
  var mystique = document.getElementById('bad-guy-list').children[1];
  var goodGuylist = document.getElementById('good-guy-list');
  goodGuylist.appendChild(mystique);
}

// Kill Striker
function removeStryker(){
  var stryker = document.getElementById('stryker');
  stryker.parentNode.removeChild(stryker);
}

// EVENTS!!!!

function clicker(){
  var button = document.getElementById('button');
  button.addEventListener('click', function(){
  alert('Get me a Beer!')
});
}
clicker();

function clickProfX(){
  var x = document.getElementById('x');
  x.addEventListener('click', addGambit);
}
clickProfX();

function colorize(){
  var form = document.getElementById('paint');
  form.addEventListener('submit', function(event){
    event.preventDefault();
    var color = document.getElementById('input').value;
    document.body.style.backgroundColor = color;
  });
}
colorize();
