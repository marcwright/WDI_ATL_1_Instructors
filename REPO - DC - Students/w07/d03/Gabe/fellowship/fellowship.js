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

var lands = [
 'The Shire',
 'Rivendell',
 'Mordor'
];


//   INSTRUCTIONS:

// No. 1
// create a section tag with an id of middle-earth
// add each land as an article tag
// inside each article tag include an h1 with the //name of the land.
// append middle-earth to your document body.

function makeMiddleEarth(lands) {

  //create a section called 'middleEarth'...
   var middleEarth = document.createElement('section');

   //give it the id of 'middle-earth'
   middleEarth.id = 'middle-earth';

    //for each things you find in the
    // lands array (see up above) DO...
   for(var i = 0; i < lands.length; i++) {

    //create an article, called 'land'...
    var land = document.createElement('article');

    //create an h1 called name, put lands[i] in it
    // (aka put element #i from lands array in it)
    var name = document.createElement('h1');
    name.textContent = lands[i];

    //put the h1 (with a land inside)called name
    // at the end of the article called 'land'...
    land.appendChild(name);

    //put 'land' article at the
    // end of 'middle earth'...
    middleEarth.appendChild(land);

    //put 'middleEarth' at the end of the document body!...
    document.body.appendChild(middleEarth);
   }
}

//invoke the makeMiddleEarth function! Voila!
makeMiddleEarth(lands);


// INSTRUCTIONS:

// No. 2
// display an unordered list of hobbits in the shire.
// give each hobbit a class of hobbit.

function makeHobbits(hobbits) {

   //create an Unordered list called 'hobbits'...
    var hobbitList = document.createElement('ul');

    //for each things you find in the
    // hobbits array (see up above) DO...
    for(var i = 0; i < hobbits.length; i++) {

    //create an li called name, put hobbits[i] in it
    // (aka put element #i from hobbits array in it)
    var hobname = document.createElement('li');
    hobname.textContent = hobbits[i];

    //give it the class of 'hobbit'
    hobname.class = 'hobbit';

    //put the li (with a hobbit inside)called hobname
    // at the end of the UnorderdList called 'hobbits'...
    hobbitList.appendChild(hobname);
   }
   //get the shire...
    var shire = document.queryElementId('#h1');

    //put 'hobbits' UL at the
    // end of 'the shire'...
    shire.appendChild(hobbitList);
}

//invoke the makeHobbits function:
makeHobbits(hobbits);

// 3

function keepItSecretKeepItSafe() {
  // create a div with an id of 'the-ring'
  // add the ring as a child of Frodo
}


//4


function makeBuddies(buddies) {
  // create an aside tag
  // display an unordered list of buddies in the aside
  // insert your aside before rivendell
}


// 5


function beautifulStranger() {
  // change the buddy 'Strider' textnode to 'Aragorn'
}


// 6


function forgeTheFellowShip() {
  // move the hobbits and the buddies to Rivendell
  // create a new div called 'the-fellowship'
  // add each hobbit and buddy one at a time to 'the-fellowship'
  // after each character is added make an alert that they have joined your party
}
