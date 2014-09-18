// Dramatis Personae

var hobbits = [
  'Frodo Baggins',
  'Samwise \'Sam\' Gamgee',
  'Meriadoc \'Merry\' Brandybuck',
  'Peregrin \'Pippin\' Took'
];

var buddies = [
  'Gandalf the Grey',
  'Legolas',
  'Gimli',
  'Strider',
  'Boromir'
];

var lands = ['The Shire', 'Rivendell', 'Mordor'];

function makeMiddleEarth(lands) {
// create a section tag with an id of middle-earth
var middleEarth = document.createElement('section');
middleEarth.id = 'middle-earth';
  // add each land as an article tag
  for (var i = 0; i < lands.length; i++){
    var land = document.createElement('article');
    // inside each article tag include an h1 with the name of the land
    var name = document.createElement('h1');
    name.textContent = lands[i];
    
    land.appendChild(name);
    middleEarth.appendChild(land);
  }
// append middle-earth to your document body  
document.body.appendChild(middleEarth);
}
makeMiddleEarth(lands);


function makeHobbits(hobbits) {
  // display an unordered list of hobbits in the shire
  var hobbitList = document.createElement('ul');
  for (var i = 0; i < hobbits.length; i++){
    var hobbit = document.createElement('li')
    // give each hobbit a class of hobbit
    hobbit.setAttribute('class', 'hobbit');
    hobbit.textContent = hobbits[i];
    hobbitList.appendChild(hobbit);
  }
  var shire = document.querySelector('article');
  shire.appendChild(hobbitList);
}
makeHobbits(hobbits);

function keepItSecretKeepItSafe() {
  var ring = document.createElement('div');
  ring.id = 'the-ring';
  var frodo = document.querySelector('.hobbit');
  frodo.appendChild(ring);
}
keepItSecretKeepItSafe();

function makeBuddies(buddies) {
}

function beautifulStranger() {
}

function forgeTheFellowShip() {
}
