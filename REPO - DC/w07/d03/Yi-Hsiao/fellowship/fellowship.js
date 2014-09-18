// Dramatis Personae

var hobbits = [
  "Frodo Baggins",
  "Samwise 'Sam' Gamgee",
  "Meriadoc 'Merry' Brandybuck",
  "Peregrin 'Pippin' Took"
];

var buddies = [
  "Gandalf the Grey",
  "Legolas",
  "Gimli",
  "Strider",
  "Boromir"
];

var lands = ["The Shire", "Rivendell", "Mordor"];

function makeMiddleEarth( lands ) {
  // create middle earth node
  var middleEarth = document.createElement( "section" );
  middleEarth.id = "middle-earth";

  // add each land to middle earth
  for ( var i = 0; i < lands.length; i++ ) {
    var land = document.createElement( "article" );
    var name = document.createElement( "h1" );
    name.textContent = lands[i];
    land.appendChild( name );
    middleEarth.appendChild( land );
  }

  // add middle earth to document
  document.body.appendChild( middleEarth );
}

makeMiddleEarth(lands);

function makeHobbits( hobbits ) {
  // find middle earth
  var middleEarth = document.getElementById( "middle-earth" );

  // create a list to store hobbit names
  var hobbitList = document.createElement( "ul" );

  // add each hobbit to the list
  for ( var i = 0; i < hobbits.length; i++ ) {
    var hobbitItem = document.createElement( "li" );
    hobbitItem.classList.add( "hobbit" );
    hobbitItem.textContent = hobbits[i];
    hobbitList.appendChild( hobbitItem );
  }

  // add the hobbits to middle earth
  middleEarth.appendChild( hobbitList );
}

makeHobbits(hobbits);

function keepItSecretKeepItSafe() {
  // create the one ring
  var oneRing = document.createElement( "div" );
  oneRing.id = "the-ring";

  // find Frodo
  var hobbits = document.querySelectorAll( ".hobbit" );
  for ( var i = 0; i < hobbits.length; i++ ) {
    var hobbit = hobbits[i];

    // once frodo is found, add the one ring to frodo
    if ( hobbit.textContent == "Frodo Baggins" ) {
      hobbit.appendChild( oneRing );
      return;
    }
  }
}

keepItSecretKeepItSafe();

function makeBuddies(buddies) {
  // find middle earth
  var middleEarth = document.getElementById( "middle-earth" );

  // create a list to the hobbits' buddies
  var buddyParent = document.createElement( "aside" );
  var buddyList = document.createElement( "ul" );
  buddyParent.appendChild( buddyList );

  // add each buddy to the buddy list
  for ( var i = 0; i < buddies.length; i++ ) {
    var buddyItem = document.createElement( "li" );
    buddyItem.textContent = buddies[i];
    buddyList.appendChild( buddyItem );
  }

  // add the buddies to middle earth
  middleEarth.appendChild( buddyParent );
}

makeBuddies( buddies );

function beautifulStranger() {
  // find the buddies
  var buddies = document.querySelectorAll( "aside li" );

  // find strider
  for ( var i = 0; i < buddies.length; i++ ) {
    var buddy = buddies[i];

    // once strider is found
    if ( buddy.textContent == "Strider" ) {
      // change his displayed name to 'Aragorn'
      buddy.textContent = "Aragorn";
      return;
    }
  }
}

beautifulStranger();

function forgeTheFellowShip() {
  // create the fellowship
  var fellowship = document.createElement( "div" );
  fellowship.id = "the-fellowship";

  // find hobbits and buddies
  var partyMembers = document.querySelectorAll( ".hobbit, aside li" );

  // find Rivendell
  var lands = document.querySelectorAll( "#middle-earth article" );
  for ( var i = 0; i < lands.length; i++ ) {
    var land = lands[i];

    // once Rivendell is found
    if ( land.textContent == "Rivendell" ) {
      // add fellowship to rivendell
      land.appendChild( fellowship );

      // add each fellowship member one at a time and announce their entrance.
      for ( var j = 0; j < partyMembers.length; j++ ) {
        partyMember = partyMembers[j];
        fellowship.appendChild( partyMember );
        console.log( partyMember.textContent + " has joined the party." );
      }
      return;
    }
  }
}

forgeTheFellowShip();