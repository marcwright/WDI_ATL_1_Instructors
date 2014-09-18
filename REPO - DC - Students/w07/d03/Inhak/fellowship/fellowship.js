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
  var middleEarth = document.getElementById('middle-earth');

  for(var i = 0; i< lands.length; i++){
    var land = document.createElement('article');
    var name = document.createElement('h1');
    name.textContent = lands[i];
    land.appendChild(name);
    middleEarth.appendChild(land);
  }
}
makeMiddleEarth(lands);

function makeHobbits(hobbits) {
  // display an unordered list of hobbits in the shire
  var shire = document.getElementById('middle-earth').children[0];
  var hobbitList = document.createElement('ul');
  for(var i = 0; i < hobbits.length; i++){
    var hobbit = document.createElement('li');
    hobbit.setAttribute('class', 'hobbit');
    hobbit.text.Content = hobbits[i];
    hobbitList.appendChild(hobbit);
  }
}

function keepItSecretKeepItSafe() {
  var ring = document.createElement('div');
  ring.id = 'the-ring';
  var frodo = document.querySelector('.hobbit');
  frodo.appendChild(ring);
}

function makeBuddies(buddies) {
}

function beautifulStranger() {
}

function forgeTheFellowShip() {
}
