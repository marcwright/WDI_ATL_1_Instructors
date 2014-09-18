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
  // add each land as an article tag
    for (var i = 0; i < lands.length; i++){
      var newArticle = document.createElement('article');
      // inside each article tag include an h1 with the name of the land
      var name = document.createElement('h1');
      name.textContent = lands[i];

      newArticle.appendChild(name);
     (document.getElementById('middle-earth').appendChild(newArticle));
   }
}
makeMiddleEarth(lands);

function makeHobbits(hobbits) {
  for (var i = 0; i < hobbits.length; i++) {
    var newList = document.createElement('ul');
    var lineItem = document.createElement('li');
    lineItem.setAttribute('class','hobbit');
    lineItem.textContent = hobbits[i];
    newList.appendChild(lineItem);
    document.querySelector('h1').appendChild(newList);
  }
}
makeHobbits(hobbits);

function keepItSecretKeepItSafe() {
  var ringDiv = document.createElement('div');
  ringDiv.id = 'the-ring';

  var frodo = document.querySelector('.hobbit');
  frodo.appendChild(ringDiv);
}
keepItSecretKeepItSafe();

function makeBuddies(buddies) {
  for(var i = 0; i < buddies.length; i++){
    var buddyTag = document.createElement('aside');
    var buddyList = document.createElement('ul');
    var buddyLineItem = document.createElement('li');
    buddyLineItem.textContent = buddies[i];
    buddyList.appendChild(buddyLineItem);
    var rivHead = document.querySelectorAll('h1')[1];
    document.rivHead.insertBefore(buddyList, rivHead);
  }
}
makeBuddies(buddies);

function beautifulStranger() {
}

function forgeTheFellowShip() {
}
