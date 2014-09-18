//Log all of the good guys

function logGoodGuys() {
  console.log('Here are the good guys');
  var goodGuys = document.getElementById('good-guy-list').children;
  for( var i = 0; i < goodGuys.length; i++ ) {
    console.log(goodGuys[i].textContent);
  }
}

function loganize() {
  var wolverine = document.getElementById('good-guy-list').children[1];
  wolverine.textContent = "Logan";
}

function addColorToStorm() {
  var storm = document.getElementById('good-guy-list').children[3];
  storm.style.background = 'blue';
  storm.style.color = 'white';
}

addColorToStorm();

function addColorToMagneto() {
  var magneto = document.getElementById('bad-guy-list').children[0];
  magneto.style.background = 'purple';
  magneto.style.color = 'red';
}

addColorToMagneto();

function bigTitle() {
  var title = document.querySelector('h1');
  title.classList.toggle('big');
}

bigTitle();

function changeTagFont(tagName, fontFamily) {
  var elems = document.getElementsByTagName(tagName);
  for (var i = 0; i < elems.length; i++) {
    elems[i].style.fontFamily = fontFamily;
  }
}

changeTagFont('h1', 'Lobster Two');


function addSuperPowersToMutants() {
  var mutants = document.querySelectorAll('.mutant');
  for (var i = 0; i < mutants.length; i++ ) {
    mutants[i].innerHTML += ' has super powers!';
  }
}

addSuperPowersToMutants();


function addGambit(){
  var goodGuys = document.querySelector('#good-guy-list');
  var gambit = document.createElement('li');
  gambit.classList.add('mutant');
  gambit.classList.add('cajun');
  gambit.textContent = 'Gambit';
  goodGuys.appendChild(gambit);
}

function clicker(){
  var button = document.getElementById('button');
  button.addEventListener('click', function(){
    alert('schwoo');
  });
}

function clickProfessorX(){
  var profx = document.getElementById('x');
  profx.addEventListener('click', addGambit);
}

clickProfessorX();
function colorize(){
  form = document.getElementById('paint')
}

function colorize(){
  var form = document.getElementById('paint');
  form.addEventListener('submit', function(event){
    event.preventDefault();
    var color = document.getElementById('input').value;
    document.body.style.backgroundColor = color;
  });
}
colorize();
