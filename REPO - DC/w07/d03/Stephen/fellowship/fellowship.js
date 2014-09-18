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
  var m = document.createElement( 'section' );
  m.id = 'middle-earth';

  // add each land as an article tag
  for ( var i = 0, len = lands.length; i < len; i++ ) {
    var article = document.createElement( 'article' );
    var header = document.createElement( 'h1' );

    header.textContent = lands[i];

    m.appendChild( header );
    m.appendChild( article );
  }

  // append middle-earth to your document body
  document.body.appendChild( m );
}

function makeHobbits(hobbits) {
  // display an unordered list of hobbits in the shire
  var ul = document.createElement( 'ul' );
  for ( var i = 0, len = hobbits.length; i < len; i++ ) {
    var li = document.createElement( 'li' );
    li.textContent = hobbits[i];

    // give each hobbit a class of hobbit
    li.classList.add( 'hobbit' );

    ul.appendChild( li );
  }

  var riv = document.getElementById( 'middle-earth' ).childNodes[2];
  document.getElementById( 'middle-earth' ).insertBefore( ul, riv );
}

function keepItSecretKeepItSafe() {
  var r = document.createElement( 'div' );
  r.id = 'the-ring';
  r.textContent = "THE RING";

  var list = document.getElementById( 'middle-earth' ).childNodes[2];
  list.childNodes[0].appendChild( r );
}

function makeBuddies(buddies) {
  var a = document.createElement( 'aside' );
  var ul = document.createElement( 'ul' );
  a.appendChild( ul );

  for ( var i = 0, len = buddies.length; i < len; i++ ) {
    var li = document.createElement( 'li' );
    li.textContent = buddies[i];
    ul.appendChild( li );
  }

  var riv = document.getElementById( 'middle-earth' ).childNodes[3];
  document.getElementById( 'middle-earth' ).insertBefore( a, riv );
}

function beautifulStranger() {
  var a = document.querySelector( 'aside' ).childNodes[0].childNodes[3];
  a.textContent = 'Aragorn';
}

function forgeTheFellowShip() {
  var riv = document.getElementById( 'middle-earth' ).childNodes[4];

  // move the hobbits and the buddies to Rivendell
  riv.appendChild( document.querySelector( 'ul') );
  riv.appendChild( document.querySelector( 'aside' ) );

  // create a new div called 'the-fellowship'
  var f = document.createElement( 'div' );
  f.id = 'the-fellowship';

  // add each hobbit and buddy one at a time to 'the-fellowship'
  for ( var i = 0, len = hobbits.length; i < len; i++ ) {
    h = document.createElement( 'p' );
    h.textContent = hobbits[i];
    f.appendChild( h );
    alert( hobbits[i] + ' has joined your party!' );
  }

  for ( var i = 0, len = buddies.length; i < len; i++ ) {
    b = document.createElement( 'p' );
    b.textContent = buddies[i];
    f.appendChild( b );
    alert( buddies[i] + ' has joined your party!' )
  }

  document.body.appendChild( f );
}

// testing the methods from above
makeMiddleEarth( lands );
makeHobbits( hobbits );
keepItSecretKeepItSafe();
makeBuddies( buddies );
beautifulStranger();
forgeTheFellowShip();
