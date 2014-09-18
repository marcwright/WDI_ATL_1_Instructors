// Log all of the good guys
function logGoodGuys(){
  console.log("Here are the good guys:");
  var goodGuys = document.getElementById('good-guy-list').children;
  for( var i = 0; i < goodGuys.length; i++){
    console.log(goodGuys[i].textContent);
  }
}
logGoodGuys();

// Change Wolverine to Logan
function loganize(){
  var wolverine = document.getElementById('good-guy-list').children[1];
  wolverine.textContent = 'Logan';
}
loganize();

// Change Storm to white on a black background
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

// Add the 'big' class to Professor X
function bigTitle(){
  var title = document.querySelector('h1');
  title.classList.toggle('big')
}
bigTitle();

// Add the 'big' class to Professor X
function centerTitle(){
  var title = document.querySelector('h1');
  title.style.textAlign = 'center'
}
centerTitle();

// Given a tag name and font, change the font
function changeTagFont(tagName, fontFamily){
  // get all instances of a tag
  var elems = document.getElementsByTagName(tagName);
  // iterate on array of nodes
  for (var i = 0; i < elems.length; i++){
    //set the font family to be the specified font
    elems[i].style.fontFamily = fontFamily;
  }
}
changeTagFont('h1', 'Lobster Two');

// Log all of the humans
function logHumans(){
  console.log("Here are the humans:");
  var humans = document.querySelectorAll('.human');
  for( var i = 0; i < humans.length; i++){
    console.log(humans[i].textContent);
  }
}
logHumans();

// Add 'has super powers' to all of the mutants
function addSuperPowersToMutants(){
  var mutants = document.querySelectorAll('.mutant');
  for( var i = 0; i < mutants.length; i++){
    mutants[i].innerHTML += ' has super powers!';
  }
}
addSuperPowersToMutants();

////////////////////////////////////////
// Appending and Removing
////////////////////////////////////////

//Add a header
function createHeader(text){
  var otherStuff = document.querySelector('#other-stuff');
  var header = document.createElement('h2');
  header.textContent = text;
  otherStuff.appendChild(header);
}
createHeader('The Sentinels are coming!!')

//Create Good guy
function createGoodGuy(name){
  var goodGuyList = document.getElementById('good-guy-list');
  goodGuy = document.createElement('li');
  goodGuy.className = 'mutant';
  goodGuy.textContent = name;
  goodGuyList.appendChild(goodGuy);
}
createGoodGuy('Rogue')

// Move Mystique from a bad guy to a good guy
function changeOfHeart(){
  var mystique = document.getElementById('bad-guy-list').children[1];
  var goodGuyList = document.getElementById('good-guy-list');
  goodGuyList.appendChild(mystique);
}
changeOfHeart();

//Remove Stryker
function removeStryker(){
  var stryker = document.getElementById('stryker');
  stryker.parentNode.removeChild(stryker);
}
removeStryker();


////////////////////////////////////////
// Event Listeners
////////////////////////////////////////

//Add an event listener
function clicker(){
  var button = document.getElementById('button');
  button.addEventListener('click', function(){
    alert('hi!');
  });
}
clicker();

// smileys
function appendSmileysToDom(){
  for (var i = 0; i < 10; i++){
    var circle = document.createElement('div');
    circle.style.width  = '50px';
    circle.style.height = '50px';
    circle.style.borderRadius = '25px';
    circle.style.backgroundColor = 'yellow';
    circle.style.textAlign = 'center';
    circle.style.fontSize = '25px';
    circle.style.display = 'inline-block'
    circle.textContent = '^_^';
    document.body.appendChild(circle);
  }
}
appendSmileysToDom(10,50);

function smileyGun(){
  var button = document.getElementById('button');
  button.addEventListener('click', appendSmileysToDom);
}
smileyGun();

//Colorize background
function colorize(){
  form = document.getElementById('paint');
  form.addEventListener('submit', function(e){
    e.preventDefault();
    var color = document.getElementById('input').value;
    document.body.style.background = color;
  });
}
colorize();