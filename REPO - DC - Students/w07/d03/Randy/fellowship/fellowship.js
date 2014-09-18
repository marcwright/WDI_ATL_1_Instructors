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
  var middleEarth = document.createElement('section');
  middleEarth.id = 'middle-earth';

  for (i = 0; i < lands.length; i++){
    var newArticle = document.createElement('article');
    var newHeader = document.createElement('h1');
    newHeader.textContent = lands[i];
    newArticle.appendChild(newHeader);
    middleEarth.appendChild(newArticle);
  }
  document.body.appendChild(middleEarth);
}
makeMiddleEarth(lands);


function makeHobbits(hobbits) {
  var land = document.querySelector('h1');
  var unorderedList = document.createElement('ul');

  land.appendChild(unorderedList);

  for (i = 0; i < hobbits.length; i++){

    var item = document.createElement('li');
    item.setAttribute('class', 'hobbit');
    item.textContent = hobbits[i];
    unorderedList.appendChild(item);
  }
}
makeHobbits(hobbits);

function keepItSecretKeepItSafe() {
  var ring = document.createElement('div');
  ring.id = 'the-ring';

  (document.querySelector('.hobbit')).appendChild(ring);
}
keepItSecretKeepItSafe();

function makeBuddies(buddies) {
  var asideTag = document.createElement('aside');
  var ul = document.createElement('ul');
  for (i = 0; i < buddies.length; i++){


  }
}

function beautifulStranger() {
}

function forgeTheFellowShip() {
}
