/*
* @Author: stephenstanwood
* @Date:   2014-06-07 08:17:56
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-06-07 11:54:43
*/

function TTT() {
  this.reset();
}

TTT.prototype = {
  // we're playing using a 3x3 board
  DIMENSION: 3,
  Xs: [],
  Os: [],
  active: true,
  victory: false,
  xTurn: true,
  maxMovesRemaining: 0,

  reset: function() {
    // get blank boards to track Xs and Os
    this.emptyBoard( this.Xs );
    this.emptyBoard( this.Os );
    this.active = true;
    this.victory = false;

    // X goes first
    this.xTurn = true;
    this.maxMovesRemaining = this.DIMENSION * this.DIMENSION;
  },

  emptyBoard: function( arr ) {
    for ( var i = 0; i < this.DIMENSION; i++ ) {
      arr[ i ] = this.falseRow();
    }
  },

  falseRow: function() {
    var res = [];
    for ( var i = 0; i < this.DIMENSION; i++ ) {
      res.push( false );
    }

    return res;
  },

  checkForVictory: function( arr ) {
      // checks for horizontal victories
    return arr[0][0] && arr[0][1] && arr[0][2] ||
      arr[1][0] && arr[1][1] && arr[1][2] ||
      arr[2][0] && arr[2][1] && arr[2][2] ||

      // checks for vertical victories
      arr[0][0] && arr[1][0] && arr[2][0] ||
      arr[0][1] && arr[1][1] && arr[2][1] ||
      arr[0][2] && arr[1][2] && arr[2][2] ||

      // checks for diagonal victories
      arr[0][0] && arr[1][1] && arr[2][2] ||
      arr[0][2] && arr[1][1] && arr[2][0];
  },

  // Check to see if this letter exists within the guesses array:
  hasGuess: function(letter) {
    return this.guesses.indexOf(letter) >= 0;
  },


  hasWordLetter: function( letter ) {
    return this.word.indexOf(letter) >= 0;
  },

  // process a user-entered guess (from 1 to DIMENSION-squared)
  guess: function( sqNum ) {
    if ( !this.active ) return;

    // converts the guess to grid coordinates (ex: 8 maps to [ 2, 1 ])
    var x = parseInt( ( sqNum - 1 ) / this.DIMENSION );
    var y = parseInt( ( sqNum - 1 ) % this.DIMENSION );

    // early return if this move has already been played
    if ( this.Xs[ x ][ y ] || this.Os[ x ][ y ] ) return;

    // if it is indeed a new move, put it on the appropriate board
    this.xTurn ? this.Xs[ x ][ y ] = true : this.Os[ x ][ y ] = true;
    this.maxMovesRemaining--;
    this.update();
  },

  squareToString: function( sqNum ) {
    var x = parseInt( ( sqNum - 1 ) / this.DIMENSION );
    var y = parseInt( ( sqNum - 1 ) % this.DIMENSION );

    if ( this.Xs[ x ][ y ] ) return 'X';
    if ( this.Os[ x ][ y ] ) return 'O';

    return '';
  },

  update: function() {
    // if there are no open spots left, the game is over
    if ( this.maxMovesRemaining === 0 ) {
      this.active = false;
    }

    // check to see if X just played a winning move
    if ( this.xTurn && this.checkForVictory( this.Xs ) ) {
      this.victory = true;
      this.active = false;
    }
    // check to see if O just played a winning move
    else if ( !this.xTurn && this.checkForVictory( this.Os ) ) {
      this.victory = true;
      this.active = false;
    }
    // if no victory & there are spots left, move on to the next turn
    else if ( this.active ) {
      this.xTurn = !this.xTurn;
    }
  }
};
