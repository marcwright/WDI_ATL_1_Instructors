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
var documentBody = $("body");

setTimeout(makeMiddleEarth, 2000);

function makeMiddleEarth(){
  // create a section tag with an id of middle-earth
  var middleEarth = $("<section>").attr("id", "middle-earth");
  // add each land as an article tag
  // inside each article tag include an h1 with the name of the land
  for(var i = 0; i < localities.length; i++){
    var landTitle = $("<h1>").text(localities[i]);
    var land = $("<article>").append(landTitle);
    // append each article tag to the middle earth <section> tag
    middleEarth.append(land);
  }
  // append middle-earth to your document body
  documentBody.prepend(middleEarth);
  // set a timer to fire off the next function in the chain, ie: makeHobbits
  setTimeout(makeHobbits, 1000);
}


function makeHobbits() {
  console.log("making hobbits");
  var theShire = $("article").first();
  // display an unordered list of hobbits within the shire (the article tag, not the h1)
  var hobbitList = $("<ul>");
  for(var i = 0; i < hobbits.length; i++){
    // give each hobbit a class of hobbit
    var hobbitLI = $("<li>").text(hobbits[i]).addClass("hobbit");
    hobbitList.append(hobbitLI);
  }
  theShire.append(hobbitList);
  // set a timer to fire off the next function, keepItSecretKeepItSafe
  setTimeout(keepItSecretKeepItSafe, 1000);
}

function keepItSecretKeepItSafe() {
  // create a div with an id of 'the-ring'
  var theOneRing = $("<div>").attr("id", "the-ring");
  // use jQuery to give the div a height and width of 15px and a background-color of gold
  theOneRing.css("height", "15px").css("width", "15px").css("background-color", "gold");
  // add an eventlistener to the ring so that when someone clicks on it, it invokes the 'nazgulScreech' function
  theOneRing.on("click", function(){
    nazgulScreech();
  })
  // add the ring as a child of Frodo
  $("li").first().append(theOneRing);
  // set a timer to fire off the next function, keepItSecretKeepItSafe
  setTimeout(makeBuddies, 1500);
}

function makeBuddies() {
  // create an aside tag
  var aside = $("<aside>");
  var buddiesUL = $("<ul>");
  // append an unordered list of buddies to the aside
  for(var i = 0; i < buddies.length; i++){
    var bud = $("<li>").text(buddies[i]);
    buddiesUL.append(bud);
  }
  aside.append(buddiesUL);
  // insert your aside BEFORE rivendell
  $($("article")[1]).before(aside);
  // set a timer to invoke the beautifulStranger function
  setTimeout(beautifulStranger, 1500);
}

function beautifulStranger() {
  console.log("beautiful stranger firing");
  // change the buddy 'Strider' textnode to 'Aragorn'
  var strider = $("ul").last().children()[3];
  $(strider).text("Aragorn");
  // set a timer to invoke the forgeTheFellowShip function
  setTimeout(forgeTheFellowShip, 1500);
}

function forgeTheFellowShip() {
  // move the hobbits and the buddies to Rivendell
  var hobbitsAndBuddies = $("li");
  var rivendell = $("article")[1];
  $(rivendell).append(hobbitsAndBuddies);
  // create a new div called 'the-fellowship'
  var newDiv = $("<div>").attr("id", "the-fellowship");
  newDiv.html("<h1>The Fellowship</h1>");
  newDiv.css("border", "1px solid black");
  $(rivendell).append(newDiv);
  // add each hobbit and buddy one at a time to 'the-fellowship'
  for(var i = 0; i < hobbitsAndBuddies.length; i++){
    newDiv.append(hobbitsAndBuddies[i]);
    var hobbitName = $(hobbitsAndBuddies[i+1]).text();
    // after each character is added make an alert that they have joined your party
    alert(hobbitName + "has joined the fellowship");
  }
}
