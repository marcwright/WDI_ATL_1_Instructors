/*
* @Author: stephenstanwood
* @Date:   2014-06-04 16:20:09
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-06-04 17:10:01
*/

var NUM_SQUARES = 8000;

function setColor() {
  var form = document.getElementById( 'form' );
  form.addEventListener( 'submit', function( e ) {
    e.preventDefault();
    changeColor();
  });
}

function appendSquares() {
  for ( var i = 0; i < NUM_SQUARES; i++ ) {
    var s = document.createElement( 'div' );
    s.classList.add( 'square' );
    document.body.appendChild( s );
  }
}

function addSquareColorChange() {
  var sqs = document.getElementsByClassName( 'square' );

  for ( var i = 0; i < NUM_SQUARES; i++ ) {
    sqs[i].addEventListener( 'mouseover', function( e ) {
      e.preventDefault();
      var color = document.getElementById( 'color-field' ).value;
      this.style.backgroundColor = color;
    });
  }
}

function changeColor() {
  var newColor = document.getElementById( 'color-field' ).value;

  var c1 = document.getElementById( 'brush' ).style.backgroundColor;
  var c2 = document.getElementById( 'swatch2' ).style.backgroundColor;

  // update the main brush and the color swatches
  document.getElementById( 'brush' ).style.backgroundColor = newColor;
  document.getElementById( 'swatch2' ).style.backgroundColor = c1;
  document.getElementById( 'swatch3' ).style.backgroundColor = c2;
}

function addSquareClickFunctionality() {
  var brushes = document.getElementsByClassName( 'brush' );

  for (var i = 0; i < 3; i++ ) {
    brushes[i].addEventListener( 'click', function( e ) {
      e.preventDefault();

      var newColor = this.style.backgroundColor;
      document.getElementById( 'color-field' ).value = newColor;
    });
  }
}

// testing functions
setColor();
appendSquares();
addSquareColorChange();
addSquareClickFunctionality();
