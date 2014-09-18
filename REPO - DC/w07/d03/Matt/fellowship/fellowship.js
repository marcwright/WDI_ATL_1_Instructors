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

  for (var i = 0; i < lands.length; i++){
    var land = document.createElement('article');

    var name = document.createElement('h1');
    name.textContent = lands[i];

    land.appendChild(name);
    middleEarth.appendChild(land);
  }
  document.body.appendChild(middleEarth);
}

makeMiddleEarth(lands);

function makeHobbits(hobbits) {
  var hobbitList = document.createElement('ul');


  for (var i = 0; i < hobbits.length; i++){
    var hobbit = document.createElement('li');
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

  var frodo = document.querySelector('.hobbit')
  frodo.appendChild(ring);
}

keepItSecretKeepItSafe();

function makeBuddies(buddies) {

  var aside = document.createElement('aside');
  var budList = document.createElement('ul');

  for (var i = 0; i < buddies.length; i++){
    var buddy = document.createElement('li');
    hobbit.setAttribute('class', 'hobbit');
    hobbit.textContent = hobbits[i];
    hobbitList.appendChild(hobbit);
  }

}

function beautifulStranger() {
}

function forgeTheFellowShip() {
}
