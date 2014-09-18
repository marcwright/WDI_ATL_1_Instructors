// Logs all of the good guys
function logGoodGuys(){
  console.log('Here are the good guys:');
  var goodGuys = document.getElementById('good-guy-list').children;
  for(var i = 0; i < goodGuys.length; i++){
    console.log(goodGuys[i].textContent)
  }
}

// Change wolverine to logan
function loganize() {
  var wolverine = document.getElementById('good-guy-list').children[1];
  wolverine.textContent = 'Logan';
}
loganize();

// Change Storm
function addColorToStorm() {
  var storm = document.getElementById('good-guy-list').children[3];
  storm.style.color = 'white';
  storm.style.background = 'black';
}

addColorToStorm();

function addColorToMagneto() {
  var storm = document.getElementById('bad-guy-list').children[0];
  storm.style.color = 'purple';
  storm.style.background = 'green';
}

addColorToMagneto();

// Add the big class to title
function bigTitle() {
  var title = document.querySelector('h1');
  title.classList.toggle('big');
}

// Given tag and font, change the font
function changeTagFont(tagName, fontFamily) {
  // Get all instances of a tag
  var elems = document.getElementsByTagName(tagName);
  // Iterate through
  for (var i = 0; i < elems.length; i++) {
    elems[i].style.fontFamily = fontFamily;
  }
}

changeTagFont('h2', 'Lobster Two');

// All mutants have superpowers
function addSuperPowersToMutants(){
  var mutants = document.querySelectorAll('.mutant');
  for (var i = 0; i < mutants.length; i++){
    mutants[i].innerHTML += ' has super powers!';
  }
}

addSuperPowersToMutants();


// append
function addGambit() {
  var goodGuys = document.querySelector('#good-guy-list');
  var gambit = document.createElement('li');
  gambit.classList.add('mutant');
  gambit.classList.add('dog');
  gambit.textContent = "Gambit";
  goodGuys.appendChild(gambit);
}

addGambit();

// move mystique from bad to good list
function moveMystique() {
  var mystique = document.getElementById('bad-guy-list').children[1];
  var goodGuyList = document.getElementById('good-guy-list');
  goodGuyList.appendChild(mystique);
}

moveMystique();

// Remove Stryker
function removeStryker() {
  var stryker = document.getElementById('stryker');
  stryker.parentNode.removeChild(stryker);
}

removeStryker();

/////////
// Events
/////////

function clicker() {
  var button = document.getElementById('button');
  button.addEventListener('click',
    function() {
      alert('click!')
    });
}

clicker();

function clickProfX() {
  var profX = document.getElementById('x');
  profX.addEventListener('click', addGambit);
}

clickProfX();

function colorize() {
  var form = document.getElementById('paint');
  form.addEventListener('submit', function(e) {
    e.preventDefault();
    var color = document.getElementById('input').value;
    document.body.style.backgroundColor = color;
  });
}



colorize();
