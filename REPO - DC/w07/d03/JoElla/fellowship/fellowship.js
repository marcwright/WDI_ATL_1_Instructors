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
  for (var i = 0; i < lands.length; i++) {
    var article = document.createElement('article');
    var land = document.createElement('h1');
    land.textContent = lands[i];
    var middleEarth = document.getElementById('middle-earth');
    middleEarth.appendChild(article);
    article.appendChild(land);
  }
}

makeMiddleEarth(lands);

 // display an unordered list of hobbits in the shire
  // give each hobbit a class of hobbit
function makeHobbits(hobbits) {
  var list = document.createElement('ul');
    for (var i = 0; i < hobbits.length; i++) {
    var listItem = document.createElement('li');
    listItem.textContent = hobbits[i];
    listItem.className = 'hobbit';
    var shire = document.querySelector('h1');
    shire.appendChild(list);
    list.appendChild(listItem);
  }
}

makeHobbits(hobbits);

 // create a div with an id of 'the-ring'
  // add the ring as a child of Frodo
function keepItSecretKeepItSafe() {
  var ring = document.createElement('div');
  ring.id = 'the-ring';
  frodes = document.querySelector('.hobbit');
  frodes.appendChild(ring);
}

keepItSecretKeepItSafe();


// create an aside tag
  // display an unordered list of buddies in the aside
  // insert your aside before rivendell
function makeBuddies(buddies) {
}

function beautifulStranger() {
}

function forgeTheFellowShip() {
}
