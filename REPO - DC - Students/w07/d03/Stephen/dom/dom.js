/*
* @Author: stephenstanwood
* @Date:   2014-06-04 11:27:56
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-06-04 16:14:37
*/

// logs all of the good guys
function logGoodGuys() {
  console.log( 'Here are the good guys:' );
  var goodGuys = document.getElementById( 'good-guy-list' ).children;
  for ( var i = 0; i < goodGuys.length; i++ ) {
    console.log( goodGuys[i].textContent );
  }
}

function addColorToMagneto() {
  var m = document.getElementById( 'bad-guy-list' ).children[0];
  m.style.color = 'red';
  m.style.background = 'purple';
}

// add the big class to the title
function addBigClassToTitle() {
  var t = document.querySelector( 'h1' );
  t.classList.toggle( 'big' );
}

function addGambit() {
  var goodGuys = document.querySelector( '#good-guy-list' );
  var gambit = document.createElement( 'li' );
  gambit.textContent = 'Gambit';
  goodGuys.appendChild( gambit );
}

// move mystique from bad guys to good guys
function changeOfHeart() {
  var m = document.getElementById( 'bad-guy-list' ).children[1];
  document.getElementById( 'good-guy-list').appendChild( m );
}

function removeStriker() {
  var s = document.getElementById( 'stryker' );
  s.parentNode.removeChild( s );
}

var button = document.getElementById('button');
button.addEventListener( 'click', function() { alert( 'click!' ) } );

var x = document.getElementById('x');
x.addEventListener( 'click', addGambit );

function colorize() {
  var form = document.getElementById( 'paint' );
  form.addEventListener( 'submit', function( e ) {
    e.preventDefault();
    var color = document.getElementById( 'input' ).value;
    document.body.style.backgroundColor = color;
  });
}

colorize();
