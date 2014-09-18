// I have written and deleted I don't know how many times.
// I do not understand how to write a game in only the model using no HTML when JavaScript
// relies on HTML elements to function. I was just so completely lost on this homework.


// What I know I'd need


// A way to reset the game to base settings
// function Game(){
//   this.reset();
// }

// // Game prototype stuff
// Game.prototype = {
//   // A 3-row game board of 3 values per row
//   board = [[0, 1, 2],[3, 4, 5],[6, 7, 8]],
//   // Victory conditions
//   winningCombos = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]];
//   // An array for X choices
//   xPicks = [],
//   // An array for O choices
//   oPicks = [],
//   // If the game is active (like the hangman example)
//   gameActive: true,
//   // If victory has been acheived (game over)
//   victory: false,
//   // A way of determining player turn (X starts)
//   xTurn = true,
//   // The number of turns remaining
//   turnsLeft: 0,

//   //the reset function (Likein hangman)
//   reset: function() {
//   },

//   // A function to check victory conditions
//   checkVictory: function(playerChoicesArray) {
//     // Need to check 8 victory possibilites
//     // See if users array contains any of the victory condition arrays
//   },

//   availablePick: function(){
//   // Need a way to check if the users choice has been picked already
//   // I read about possibly using the .one method to only allow a button to be click once
//   // and then be unavailable after that.
//     // But I never really got to the point of making that happen
//       // Also could use if statement to go through xPicks or oPicks to see if they had guessed that already
//   },

//   // Some function to save the user guess to that users array
//     // Following is edited from Hangman
//   userGuess: function(button) {

//     // If the game is over, then don't run the rest of this function.
//     if (!this.active) return;

//     // If the button has not yet been picked...
//     if (!this.availablePick(button)) {

//       if (xTurn){
//     // Let's add the letter into the guesses array.
//       this.xPicks.push(button.value);
//     } else
//       this.oPicks.push(button.value);

//     // Call update to reasses the game state.
//     this.update();
//     }
//   },
// }


// I am really looking forward to hopefully going over this in class.
// I do not like not having a clue how to go about things.





////////////////////////////// IN CLASS //////////////////////////////////
////////////////////////////////// Time for Comments //////////////////////////////////
// each new game begins with player x and an empty board
    // This is the game constuctor function w/ preset data all version of GAME will start with.
    //
function Game(){
  this.turn = "x";
  this.turnNumber = 0;
  this.board = new Array(new Array(3), new Array(3), new Array(3));
}

/////PROTOTYPE/////
/// Location Here is an OBJECT ///
// Whatever we pass into the playAt function, expect it to have a row and column value
// Will tell you if there is an undefined value at the specified location
Game.prototype.playAt = function(location) {
  return this.board[location.row][location.column];
};


//Turnary Operator
// Changes the turn between X and O
// if turn is X, make it O, otherwise set it to X
Game.prototype.nextTurn = function() {
  this.turn = ( this.turn === "x" ? "o" : "x" );
};

//Marking a spot
//If The game has ended (as determined by calling the gameOver function) throw an error
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
