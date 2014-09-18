// each new game begins with player x and an empty board
function Game(){
  this.turn = "x";
  this.turnNumber = 0;
  this.board = new Array(new Array(3), new Array(3), new Array(3));
}

Game.prototype.playAt = function(location) {
  return this.board[location.row][location.column];
};

Game.prototype.nextTurn = function() {
  this.turn = ( this.turn === "x" ? "o" : "x" );
};

Game.prototype.mark = function(play, location) {
  if ( this.gameOver() ) {
    throw new Error("game over!");
  }

  // if the spot hasn't been taken and it's the appropriate player's turn, mark the turn
  if (!this.playAt(location) && play === this.turn) {
    // 'location.row' and 'location.column' tell you that location argument should be
    // an object with a 'row' property and a 'column' property
    this.board[location.row][location.column] = play;
    this.turnNumber++;
    this.nextTurn();
  }
};


Game.prototype.gameOver = function() {
  // if the check winner method returns anything other than undefined,
  // then we know it IS defined and the game is over
  if (this.checkWinner() !== undefined) {
    return true;
  }

  // if the game has more than 8 turns, we terminate it regardless of whether a champion has been crowned
  if (this.turnNumber > 8) {
    return true;
  }

  return false;
};

// checkWinner will return undefined unless a winning condition is met
Game.prototype.checkWinner = function() {

  // for each ROW in the board
  for(var i = 0; i < 3; i++){
    // first we check that the row in question begins with a valid value (ie: either 'x' or 'o')
    // then we check if the next two values
    if( (this.board[i][0] === "x" ||
         this.board[i][0] === "o") &&
        (this.board[i][0] === this.board[i][1]) &&
        (this.board[i][1] === this.board[i][2]) ){
      return this.board[i][0]; // if condition is met, return the winning character
    }
  }

  // for each COLUMN in the board
  for(var i = 0; i < 3; i++){
    if( (this.board[0][i] === "x" ||
         this.board[0][i] === "o") &&
        (this.board[0][i] === this.board[1][i]) &&
        (this.board[1][i] === this.board[2][i]) ){
      return this.board[0][i];
    }
  }
  // diagonal top left
  if( (this.board[0][0] === "x" ||
       this.board[0][0] === "o") &&
      (this.board[0][0] === this.board[1][1]) &&
      (this.board[1][1] === this.board[2][2]) ){
    return this.board[1][1];
  }
  // diagonal top right
  if( (this.board[0][2] === "x" ||
       this.board[0][2] === "o") &&
      (this.board[0][2] === this.board[1][1]) &&
      (this.board[1][1] === this.board[2][0]) ){
    return this.board[1][1];
  }

};
