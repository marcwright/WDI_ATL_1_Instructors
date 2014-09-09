console.log("I like turtles");

var winningCombos = [
  this.board.row[0]

];

function Game(){
  this.player1Turn = true;
  this.active = true;
  this.board = {
    row1: [null, null, null],
    row2: [null, null, null],
    row3: [null, null, null]
  };
}

Game.prototype.togglePlayer = function(){
  this.player1Turn = !this.player1Turn;
};

Game.prototype.endGame = function(){
  this.active = false;
};

Game.prototype.takeTurn = function(){

  var choice = this.player1Turn ? "X" : "O";
  // the user is going to have to pick a row and a column
  var rowNum = prompt("In what row does your square reside? (Enter a number: 1, 2, or 3)"),
      column = parseInt(prompt("In what column? (Enter a number: 1, 2, or 3)"));
  this.board["row" + rowNum][column - 1] = choice;
  this.togglePlayer();
};

var game = new Game();



