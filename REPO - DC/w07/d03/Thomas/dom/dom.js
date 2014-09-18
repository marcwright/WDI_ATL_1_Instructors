// Logs all of the good guys
function logGoodGuys() {
  console.log('here are the good guys:');
  var goodGuys = document.getElementById("good-guy-list").children;
  for (var i = 0; i < goodGuys.length; i++) {
    console.log(goodGuys[i].textContent)
  }
}


// Change Wolverine to Logan
function loganize() {
  var logan = document.getElementById('good-guy-list').children[1]
  logan.textContent = 'Logan'
}
loganize();

// Change Storm's color
function addColorToStorm() {
  var storm = document.getElementById('good-guy-list').children[3]
  storm.style.background = 'blue';
  storm.style.color = 'white';
}
addColorToStorm();

// Change magneto to red on purple background
function addColorToMagneto() {
  var magneto = document.getElementById('bad-guy-list').children[0]
  magneto.style.background = 'purple';
  magneto.style.color = 'red';
}
addColorToMagneto();

// Add the big class to title
function bigTitle() {
  var title = document.querySelector('h1');
  title.classList.toggle('big');
}

// given a tag name and font, change the font
function changeTagFont(tagName, fontFamily) {
  //get instances
  var elems = document.getElementsByTagName(tagName);
  //iterate over the array of nodes
  for (var i = 0; i < elems.length; i++) {
    elems[i].style.fontFamily = fontFamily;
  }
}

// all mutants have superpowers
function addSuperPowersToMutants() {
  var mutants = document.querySelectorAll('.mutant');
  for (var i = 0; i < mutants.length; i ++) {
    mutants[i].innerHTML += ' has super powers!';
  }
}
addSuperPowersToMutants();

// add gambit to the good guy good-guy-list
function addGambit() {
  var goodGuys = document.querySelector('#good-guy-list');
  var gambit = document.createElement('li');
  gambit.classList.add('mutant')
  gambit.textContent = 'Gambit';
  goodGuys.appendChild(gambit);
}

// move mystique from bad guys to good guys
function changeOfHeart() {
  var mystique = document.getElementById('bad-guy-list').children[1]
  var goodGuys = document.querySelector('#good-guy-list');
  goodGuys.appendChild(mystique);
}
changeOfHeart();

// remove stryker
function removeStryker() {
  var stryker = document.getElementById('stryker');
  stryker.parentNode.removeChild(stryker);
}

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

function colorize() {
  var form = document.getElementById('paint');
  form.addEventListener('submit', function(event) {
    console.log(event);
    event.preventDefault();
    var color = document.getElementById('input').value
    document.body.style.backgroundColor = color;
  });
}

colorize();
