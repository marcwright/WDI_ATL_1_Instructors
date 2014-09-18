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
  // add each land as an article tag
  // inside each article tag include an h1 with the name of the land
  // append middle-earth to your document body
  var middleEarth = document.querySelector('#middle-earth');
  for (var i = 0; i < lands.length; i++){
    land = document.createElement('article');
    landHeading = document.createElement('h1');
    landHeading.textContent = lands[i];

    middleEarth.appendChild(land);
    land.appendChild(landHeading);
  };

}
makeMiddleEarth(lands);

function makeHobbits(hobbits) {
   // display an unordered list of hobbits in the shire
  // give each hobbit a class of hobbit
  var shire = document.getElementsByTagName('article')[0];
  var hobbitsList = document.createElement('ul');
  shire.appendChild(hobbitsList);
  for (var i = 0; i < hobbits.length; i++){
    hobbit = document.createElement('li');
    hobbit.textContent = hobbits[i];
    hobbit.classList.add('hobbit');
    hobbitsList.appendChild(hobbit);
  }

}
makeHobbits(hobbits);

function keepItSecretKeepItSafe() {
  // create a div with an id of 'the-ring'
  // add the ring as a child of Frodo
  var ring = document.createElement('div');
  ring.id = 'the-ring';
  var frodo = document.querySelectorAll('.hobbit')[0];
  frodo.appendChild(ring);
}
keepItSecretKeepItSafe();

function makeBuddies(buddies) {
  // create an aside tag
  // display an unordered list of buddies in the aside
  // insert your aside before rivendell
  var middleEarth = document.querySelector('#middle-earth');
  var rivendell = document.querySelectorAll('article')[1];
  buddiesAside = document.createElement('aside');
  buddiesUl = document.createElement('ul');
  buddiesAside.appendChild(buddiesUl);
  for (var i = 0; i < buddies.length; i++){
    buddy = document.createElement('li');
    buddy.textContent = buddies[i];
    buddiesUl.appendChild(buddy);
  };

  middleEarth.insertBefore(buddiesAside, rivendell);
}
makeBuddies(buddies);

function beautifulStranger() {

  // change the buddy 'Strider' textnode to 'Aragorn'
  strider = document.querySelectorAll('ul')[1].children[3];
  strider.textContent = 'Aragorn';
}
beautifulStranger();

function forgeTheFellowShip() {
  // move the hobbits and the buddies to Rivendell
  // create a new div called 'the-fellowship'
  // add each hobbit and buddy one at a time to 'the-fellowship'
  // after each character is added make an alert that they have joined your party
  var hobbitsBuddies = document.querySelectorAll('li');
  var rivendell = document.querySelectorAll('article')[1];
  rivendell.appendChild(hobbitsBuddies);
  var fellowship = document.createElement('div');
}
forgeTheFellowShip();
