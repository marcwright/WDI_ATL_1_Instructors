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
  for(var i = 0; i < lands.length; i++){
    var land = document.createElement('article');
    land.id = lands[i];

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
  var shire = document.getElementById('The Shire');
  var hobbitsList = document.createElement('ul');
  hobbitsList.id = 'hobbits-list';
  for (var i = 0; i < hobbits.length; i++) {
    var hobbit = document.createElement('li');
    hobbit.id = hobbits[i];
    hobbit.textContent = hobbits[i];
    hobbitsList.appendChild(hobbit)
  }
  shire.appendChild(hobbitsList);
}

makeHobbits(hobbits);

function keepItSecretKeepItSafe() {
  var frodo = document.getElementById('Frodo Baggins');
  var ring = document.createElement('div');
  ring.id = 'the-ring';
  ring.textContent = 'One Ring to rule them all, One Ring to find them, One Ring to bring them all and in the darkness bind them';
  frodo.appendChild(ring);

}
keepItSecretKeepItSafe();

function makeBuddies(buddies) {
}

function beautifulStranger() {
}

function forgeTheFellowShip() {
}
