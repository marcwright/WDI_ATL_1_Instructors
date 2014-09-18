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

// 1
function makeMiddleEarth(lands) {
  // create a section tag with an id of middle-earth
  var middleEarth = document.createElement('section');
  middleEarth.id = 'middle-earth';

  // add each land as an article tag
  for(var i = 0; i < lands.length; i++){
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

// 2
function makeHobbits(hobbits) {
  // display an unordered list of hobbits in the shire
  var hobbitList = document.createElement('ul');

  for(var i = 0; i < hobbits.length; i++){
    var hobbit = document.createElement('li');
    // give each hobbit a class of hobbit
    hobbit.setAttribute('class', 'hobbit');
    hobbit.textContent = hobbits[i];
    hobbitList.appendChild(hobbit);
  }

  var shire = document.querySelector('article');
  shire.appendChild(hobbitList);
}
makeHobbits(hobbits); 

// 3
function keepItSecretKeepItSafe() {
  // create a div with an id of 'the-ring'
  var ring = document.createElement('div');
  ring.id = 'the-ring';

  // add the ring as a child of Frodo
  var frodo = document.querySelector('.hobbit')
  frodo.appendChild(ring);
}
keepItSecretKeepItSafe();

// 4
function makeBuddies(buddies) {
  // create an aside tag
  var asideTag = document.createElement('aside');
  // display an unordered list of buddies in the aside
  var buddiesList = document.createElement('ul');
  // Make the Gandalf text node have a grey background
  for (var i = 0; i < buddies.length; i++) {
    var buddy = document.createElement('li');
    buddy.textContent = buddies[i];
    buddiesList.appendChild(buddy);
  }
  asideTag.appendChild(buddiesList);
  var rivendell = document.getElementsByTagName('article')[1];
  rivendell.parentNode.insertBefore(asideTag, rivendell);
}
makeBuddies(buddies);

// 5
function beautifulStranger() {
  // change the buddy 'Strider' textnode to "Aragorn"
  var buddies = document.getElementsByTagName('aside')[0].getElementsByTagName('li');
  var strider = buddies[3];
  strider.textContent = "Aragorn";
}
beautifulStranger();


// 6
function forgeTheFellowShip() {
  // move the hobbits and the buddies to Rivendell
  // create a new div called 'the-fellowship'
  var theFellowship = document.createElement('div');
  theFellowship.id = 'the-fellowship';
  theFellowship.appendChild(document.createElement('ul'));
  // add each hobbit and buddy one at a time to 'the-fellowship'
  var hobbitList = document.getElementById('the-ring').parentNode.parentNode;
  var hobbitCount = hobbitList.childElementCount;
  for (var i = 0; i < hobbitCount; i++) {
    var hobbit = hobbitList.childNodes[0];
    theFellowship.children[0].appendChild(hobbit);
    alert(hobbit.textContent + " has joined the party");
  // after each character is added make an alert that they have joined your party
  }
  var buddies = document.getElementsByTagName('aside')[0].children[0].children;
  var buddyCount = buddies.length;
  for (var j = 0; j < buddyCount; j++) {
    var buddy = buddies[0];
    theFellowship.children[0].appendChild(buddy);
    alert(buddy.textContent + " has joined the party");
  }
  var rivendell = document.getElementsByTagName('article')[1];
  rivendell.appendChild(theFellowship);
}
forgeTheFellowShip();
