function nazgulScreech(){
  // jQuery doesn't have a play() method, so vanilla js it is
  document.getElementById("nazgul-screech").play();
}

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

var localities = ['The Shire', 'Rivendell', 'Mordor'];



function makeMiddleEarth(){
  console.log("making middle earth");
  // create a section tag with an id of middle-earth
  var #middleEarth = $("<section id='middle-earth'>");
  // add each land as an article tag
    for(var i = 0; i < localities.length; i++) {
      
    });

  // inside each article tag include an h1 with the name of the land
  // append each article tag to the middle earth <section> tag
  // append middle-earth to your document body
  // set a timer to fire off the next function in the chain, ie: makeHobbits
}

function makeHobbits() {
  console.log("making hobbits");
  // display an unordered list of hobbits within the shire (the article tag, not the h1)
  var hobbitsUL = $("<ul>");
    for (var i = 0; i < hobbits.length; i++) {
      var hobbit = $("<li>") + hobbits[i] + "</li>");
      hobbitsUL.append(hobbit);
    }
  // give each hobbit a class of hobbit
    $("article").eq(0).append(hobbitsUL);
  // set a timer to invoke the next function, keepItSecretKeepItSafe
  setTimeout(keepItSecretKeepItSafe, 2000)
}

function keepItSecretKeepItSafe() {
  console.log("keepin' it like a secret");
  // create a div with an id of 'the-ring'
  console.log("keepin it like a secret");
  // use jQuery to give the div a height and width of 15px and a background-color of gold
  var theOneRing = $("<div id='the-ring'>");
  // add an eventlistener to the ring so that when someone clicks on it, it invokes the 'nazgulScreech' function (above)
  theOneRing.css({ background-color: "gold", height: "15px", width: "15px" });
  theOneRing.on("click", nazgulScreech)
  // add the ring as a child of Frodo
  var frodo = $("ul").find(':contains("Frodo Baggins")');
  frodo.append(theOneRing);
  // set a timer to fire off the next function, makeBuddies

}

function makeBuddies() {
  console.log("makin' buddies");
  // create an aside tag
  // append an unordered list of buddies to the aside
  // insert your aside BEFORE rivendell
  // set a timer to invoke the beautifulStranger function
}

function beautifulStranger() {
  console.log("beautiful stranger firing");
  // change the buddy 'Strider' textnode to 'Aragorn'
  // set a timer to invoke the forgeTheFellowShip function
}

function forgeTheFellowShip() {
  console.log("forging the fellowship like a boss");
  // move the hobbits and the buddies to Rivendell
  // create a new div with an id of 'the-fellowship'
  // add each hobbit and buddy one at a time to 'the-fellowship'
  // after each character is added make an alert that they have joined your party
}
