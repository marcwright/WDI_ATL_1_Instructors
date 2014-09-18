function ticTacToe() {
  this.reset();
}

ticTacToe.prototype = {
  x: [],
  y: [],
  active: true,
  victory: false,
  xTurn: true,

  // Resets the game state and gives fresh value to all state attribrutes.
  reset: function() {
    this.x = [],
    this.y = [],
    this.active = true,
    this.victory = false;
    this.xTurn = true
    // TODO: this.update();

  },

  // Checks to see if this letter exists in our current list of guesses.
  squareTaken: function(xCoord, yCoord) {
    for (var i = 0; i <= this.x.length; i++) {
      if (this.x[i] === xCoord && this.y[i] === yCoord) {
        return true;
      } else {
        return false;
      }
    }
  },

  // Places an X or O on the board
  turn: function(xCoord, yCoord) {
  // If the game is over, don't run the rest of this function
    if (!this.active) return;

   // If the square has not yet been taken...
    if (this.squareTaken(xCoord, yCoord)) return;

    this.x.push(xCoord);
    this.y.push(yCoord);

    this.xTurn = !this.xTurn;

    // TODO this.update();

  }
}

  // TODO Reassess the complete game state with update function


