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
var middleEarth = document.querySelector("#middle-earth");


function makeMiddleEarth(lands) {

  for(i = 0; i < lands.length; i++) {
    var land = document.createElement("article");
    land.id = lands[i];

    var header = document.createElement("h1");
    header.innerHTML += lands[i];

    land.appendChild(header);
    middleEarth.appendChild(land);
  }
}
makeMiddleEarth(lands);

function makeHobbits(hobbits) {
  var shire = document.getElementById("The Shire")
  var hobbitses = document.createElement("ul");

  for(i = 0; i < hobbits.length; i++) {
    var hobbit = document.createElement("li");
    hobbit.innerHTML += hobbits[i];
    hobbit.classList.add("hobbit");
    hobbitses.appendChild(hobbit);
  }

  shire.appendChild(hobbitses);
}
makeHobbits(hobbits);

function keepItSecretKeepItSafe() {
  var ring = document.createElement("div");
  ring.id = "the-ring";

  var frodo = document.querySelector(".hobbit")
  frodo.appendChild(ring);
}
keepItSecretKeepItSafe();

function makeBuddies(buddies) {
  var aside = document.createElement("aside");
  var buds = document.createElement("ul");
  aside.appendChild(buds);

  for(i = 0; i < buddies.length; i++) {
    var buddy = document.createElement("li");
    buddy.innerHTML += buddies[i];
    buddy.classList.add("buddy");
    buddy.id = buddies[i];
    buds.appendChild(buddy);
  }

  var rivendell = document.getElementById("Rivendell");
  middleEarth.insertBefore(buds, rivendell);
}
makeBuddies(buddies);

function beautifulStranger() {
  strider = document.getElementById("Strider");
  strider.textContent = "Aragorn";
}
beautifulStranger();

function forgeTheFellowShip() {
  var rivendell = document.getElementById("Rivendell");
  // move the hobbits and the buddies to Rivendell
  var hobbits = document.querySelector("ul");
  rivendell.appendChild(hobbits);

  var buddies = document.getElementsByTagName("aside");
  debugger;
  rivendell.appendChild(buddies);
  // create a new div called 'the-fellowship'
  var fellowship = document.createElement("div");
  fellowship.id = "the-fellowship";
  // add each hobbit and buddy one at a time to 'the-fellowship'
  for(i=0; i < hobbits.length; i++) {
    fellowship.appendChild(hobbits[i]);
    window.alert(hobbits[i] + " has joined your party!");
  }
  // after each character is added make an alert that they have joined your party
}

forgeTheFellowShip();
