function Game() {
  this.turn = 'x';
  this.turnNumber = 0;
  this.board = new Array(new Array(3), new Array(3), new Array(3));
}

Game.prototype.playAt = function(location) {
  return this.board[location.row][location.column];
};

Game.prototype.nextTurn = function() {
  this.turn = ( this.turn === 'x' ? 'o' : 'x');
}

Game.prototype.mark = function(play, location) {
  if ( this.gameOver() ) {
    throw new Error('game over');
  }

  if (!this.playAt(location) && play === this.turn) {
    this.board[location.row][location.column] = play;
    this.turnNumber++;
    this.nextTurn();
  }
}
