// To be clarified:
//How a Model-View-Index arrangement works, in the most basic, practical terms:?

// essentially, 'prototype' is a special method you can add to a named function, which allows you to clone copies of that function. unlike most functions, though, you dont call this function by saying 'prototype' again, but by saying 'new'.

// so here, I make a named function, 'Game', that has no methods or functions for itself.
function Game(){}

//so here I am doing two things: giving 'Game' a prototype method, and giving it a function of being able to print the text 'Welcome to a new game... etc' to the console.
Game.prototype.announceGame = function(){
  console.log('Welcome to a new game of Tic Tac Toe!');
};


//here i create a new instance of my Game object, using the prototype method:
var firstTry = new Game();

//and here I try out the announceGame method i created above, on my new instance:
firstTry.announceGame();

//=====Great! the above does indeed log my weelcome text to the console.

//next, I will ask a user for an input; and set the input equal to variable 'question':
//var question = prompt('what do you choose?');

//now I will try and do the same thing, but make it a function, which can be used over and over by my program; --ive called this fuction 'questionAsker';
function questionAsker() {
  var question = prompt('what do you choose?');
};

//now ill try and invoke this function;
//questionAsker(); //YEP! it worked; it asked me a question!

//It worked, so I can now pass this qAsker function to OTHER functions,(say, if they need to ask the user a question) to help my game progress!


//now ill try to make a function called 'capturedCellAdder' which takes input and appends it to an array, called 'capturedList', and logs a confirmation message. --BUT, ill make the function input ANOTHER function, questionAsker!-- this will allow capturedCellAdder to ask questions (using qAsker) AND append to the capturedList, etc.

function capturedCellAdder(input){
  var capturedList = [];
  capturedList.push(input);
  console.log("Square " + capturedList + " has been captured!");
};

//now here ill try out capturedCellAdder...
//capturedCellAdder();   //Seems to have been working!

//ok, this wasnt working, so i think i need to swap which function i'm feeding to which; im going to embed the capturedCellAdder INSIDE a question asker!

function questionAsker2() {
  var input = prompt('what do you choose?');
  capturedCellAdder(input);
};

questionAsker2();

//Great! This is so-far working; questionAsker2 asks which we choose, and captured cell adder adds and prints out a confirmation to log!











//=================== Heres how it will work:============================

// Player1 is the first to go. they can click a tile on the board. each tile is named 1 - 9.

// When player1 clicks that tile, it's number (an html id #) is added to their array.
// the program then checks their array agains my list of all winning arrays.

// If there's no match (no victory), player 2 takes their turn, and the process
// progresses.

// Eventually one player will posess the elemnts of a winning array,
// and the game will display 'winner!', and take no more input.

// Hitting 'new game' resets the arrays and the board.
//======================================================================

//This initializes the game?
// $(document).ready(function() {

// //This will be the main object for the game. I don't know what that means:

//     function Game(){
//     };

// function TicTacToe(){
//   // arrays of all the winning combinations:
//   this.winningArrays = [
//   // columns:
//   [1, 4, 7],
//   [2, 5, 8],
//   [3, 6, 9],
//   // rows:
//   [1, 2, 3],
//   [4, 5, 6],
//   [7, 8, 9],
//   // diagonals:
//   [1, 5, 9],
//   [3, 5, 7]
//   ];

//   // arrays to 'collect' the id's of the square's the players capture:
//   var player1 = [0];
//   var player2 = [0];

//   //Keeps tracks of whose turn it is:
//   this.turn = [player1, player2];

//   //turn counter counts which turn it is. first turn is turn 0:
//   this.turnCounter = [0]

//   // keeps track of vistory:
//   this.victory =  false;

//   // supposed to add a square id # to active players 'catured squares' array
//   this.captureSquare = function(captureId) {
//         if (this.active) {
//             this.turn[0].push(captureId);
//         }
//   };




// }); //THIS ENDS THE PROGRAM INITIALIZATION!============================================================












  // // - Resets the game state.
  // // - Gives fresh value to all state attributes.
  // reset: function() {
  //   this.word = this.selectRandomWord();
  //   this.wordDisplay = '';
  //   this.active = true;
  //   this.chances = 8;
  //   this.guesses = [];
  //   this.update();
  // },

  // // Selected a random word from the list of words.
  // selectRandomWord: function() {
  //   var index = Math.round((this.words.length-1) * Math.random());
  //   return this.words[index];
  // },

  // // Checks to see if this letter exists in our current list of guesses.
  // hasGuess: function(letter) {
  //   return this.guesses.indexOf(letter) >= 0;
  // },

  // // Checks to see if the specified letter exists within the current word.
  // hasWordLetter: function(letter) {
  //   return this.word.indexOf(letter) >= 0;
  // },

  // // Recieves a letter into the game,
  // guess: function(letter) {

  //   // If the game is over, then don't run the rest of this function.
  //   if (!this.active) return;

  //   // Validate that we actually want this letter.
  //   if (letter.length != 1) {
  //     throw "this is invalid input: it requires only one character.";
  //   }

  //   // If the letter has not yet been guessed...
  //   if (!this.hasGuess(letter)) {

  //     // Let's add the letter into the guesses array.
  //     this.guesses.push(letter);

  //     // If your guess is not within the word,
  //     // we take away one of your chances.
  //     if (!this.hasWordLetter(letter)) {
  //       this.chances -= 1;
  //     }

  //     // Call update to reasses the game state.
  //     this.update();
  //   }
  // },

  // // Reassesses the complete game state:
  // update: function() {

  //   // We need to build out the word we want to display, including underscores:
  //   var display = '';
  //   var lettersMissing = 0;


  //   for (var i=0; i < this.word.length; i++) {
  //     // do we have this letter?

  //     var letter = this.word[i];
  //     var guessIsPresent = this.hasGuess(letter);

  //     // if present, display it. otherwise, fill it in with an "_"
  //     display += guessIsPresent ? letter : '_';

  //     // Count the number of missing letters to see if we're waiting on any:
  //     if (!guessIsPresent) {
  //       lettersMissing += 1;
  //     }
  //   }

  //   // If there are no letters missing, you're a winner!
  //   this.victory = !lettersMissing;


  //   if (this.active && this.chances) {
  //     this.active = !!lettersMissing;
  //   } else {
  //     this.active = false;
  //   }

  //   // is the game active? if so, display the hidden word. otherwise, show the full word.
  //   this.wordDisplay = this.active ? display : this.word;


//================================== tic tac toe game by
// http://www.codecademy.com/ckangas/codebits/gPJTFP/edit




/*
This is a basic Tic Tac Toe game.

The AI appears to fully work, but it is untested.  The case statements and jquery click calls
should be cleaned up.  Furthermore, the checkWin function could be better implemented by
using an array which contains the winning possibilities instead of the if statements.

In addition, the cpu doesn't actually draw the winning move.  I'm unsure as to why, and it's
a logic error somewhere in the program.
*/

// $(document).ready(function() {

//     //this is the array that will keep track of spaces
//     var spacesTaken = [false, false, false, false, false, false, false, false, false];
//     var takenBy = [];
//     var bestMove;
//     //1 is easy, 2 is medium, 3 is hard
//   var difficulty = 3;

//     //This will be the main object for the game
//     function Game(){
//     }

//     // This method will take an integer (1-9) and mark the appropriate
//     // square on the board.  It will also take a boolean value which
//     // will determine if the user or program is using the method.
//     // This method ASSUMES correct input.
//     Game.prototype.toArray = function(space, user){
//         spacesTaken[space] = true;
//         if(user){
//             takenBy[space] = 'O';
//         }
//         else if(!user){
//             takenBy[space] = 'X';
//         }
//     };

//     // This method will draw an X or O in the appropriate spot.
//     Game.prototype.draw = function(space, isUser){
//     //these draw Os for the user
//         if(isUser){
//             switch(space){
//                 case 1:
//                     $('div.ox1.o').show("fast");
//                     break;
//                 case 2:
//                     $('div.ox2.o').show("fast");
//                     break;
//                 case 3:
//                     $('div.ox3.o').show("fast");
//                     break;
//                 case 4:
//                     $('div.ox4.o').show("fast");
//                     break;
//                 case 5:
//                     $('div.ox5.o').show("fast");
//                     break;
//                 case 6:
//                     $('div.ox6.o').show("fast");
//                     break;
//                 case 7:
//                     $('div.ox7.o').show("fast");
//                     break;
//                 case 8:
//                     $('div.ox8.o').show("fast");
//                     break;
//                 case 9:
//                     $('div.ox9.o').show("fast");
//                     break;
//             }
//         }

//         if(!isUser){
//             // These draw Xs for the computer
//             switch(space){
//                 case 1:
//                     $('div.ox1.x').show("fast");
//                     break;
//                 case 2:
//                     $('div.ox2.x').show("fast");
//                     break;
//                 case 3:
//                     $('div.ox3.x').show("fast");
//                     break;
//                 case 4:
//                     $('div.ox4.x').show("fast");
//                     break;
//                 case 5:
//                     $('div.ox5.x').show("fast");
//                     break;
//                 case 6:
//                     $('div.ox6.x').show("fast");
//                     break;
//                 case 7:
//                     $('div.ox7.x').show("fast");
//                     break;
//                 case 8:
//                     $('div.ox8.x').show("fast");
//                     break;
//                 case 9:
//                     $('div.ox9.x').show("fast");
//                     break;
//             }
//         }
//     };

//     //This method will check to see if the user or program has won
//     //furthermore, it will check to see if the game is a tie.
//     Game.prototype.checkWin = function(){
//         //checks to see if the program (X) has won.
//         //there are 8 possible ways to victory

//         //checks rows first
//         if(takenBy[0] == 'X' && takenBy[1] == 'X' && takenBy[2] == 'X'){
//             return "X";
//         }
//         else if (takenBy[3] == 'X' && takenBy[4] == 'X' && takenBy[5] == 'X'){
//             return "X";
//         }
//         else if (takenBy[6] == 'X' && takenBy[7] == 'X' && takenBy[8] == 'X'){
//             return "X";
//         }

//         //check cols second
//         if(takenBy[0] == 'X' && takenBy[3] == 'X' && takenBy[6] == 'X'){
//             return "X";
//         }
//         else if (takenBy[1] == 'X' && takenBy[4] == 'X' && takenBy[7] == 'X'){
//             return "X";
//         }
//         else if (takenBy[2] == 'X' && takenBy[5] == 'X' && takenBy[8] == 'X'){
//             return "X";
//         }

//         //checks diagonals third
//         if(takenBy[0] == 'X' && takenBy[4] == 'X' && takenBy[8] == 'X'){
//             return "X";
//         }
//         else if (takenBy[2] == 'X' && takenBy[4] == 'X' && takenBy[6] == 'X'){
//             return "X";
//         }

//         //this checks to see if the User, or O has won
//         if(takenBy[0] == 'O' && takenBy[1] == 'O' && takenBy[2] == 'O'){
//             return "O";
//         }
//         else if (takenBy[3] == 'O' && takenBy[4] == 'O' && takenBy[5] == 'O'){
//             return "O";
//         }
//         else if (takenBy[6] == 'O' && takenBy[7] == 'O' && takenBy[8] == 'O'){
//             return "O";
//         }

//         //check cols second
//         if(takenBy[0] == 'O' && takenBy[3] == 'O' && takenBy[6] == 'O'){
//             return "O";
//         }
//         else if (takenBy[1] == 'O' && takenBy[4] == 'O' && takenBy[7] == 'O'){
//             return "O";
//         }
//         else if (takenBy[2] == 'O' && takenBy[5] == 'O' && takenBy[8] == 'O'){
//             return "O";
//         }

//         //checks diagonals third
//         if(takenBy[0] == 'O' && takenBy[4] == 'O' && takenBy[8] == 'O'){
//             return "O";
//         }
//         else if (takenBy[2] == 'O' && takenBy[4] == 'O' && takenBy[6] == 'O'){
//             return "O";
//         }

//         var isATie = true;
//         // checks to see if it is a tie
//         for(var i = 0; i < spacesTaken.length; i++){
//             if(spacesTaken[i] === false){
//                 isATie = false;
//             }
//         }
//         if(isATie){
//             return "tie";
//         }

//         //If it is not a tie, and neither person has won, it returns "neither"
//         return "neither";
//     };

//     //This function simply calls the other functions needed in the program
//     Game.prototype.doMove = function(space, isUser){

//       if(isUser){
//       match.draw(space, true);
//             match.toArray(space-1, true);
//       match.check();
//             match.cpuMove();
//         }
//         else if(!isUser){
//       match.draw(space, false);
//             match.toArray(space-1, false);
//         }

//     //checks to see if the cpu won before letting the user go again
//         match.check();
//     };

//     //This function is called when there is a winner.  It restarts the game in order to play again.
//     Game.prototype.exit = function(){
//         spacesTaken = [false, false, false, false, false, false, false, false, false];
//     takenBy = [];
//     $('div.x').hide("fast");
//     $('div.o').hide("fast");
//     match.goFirstOrSecond();
//       $(document).reload();
//     };

//   //This function is called as part of exit.  It asks the user whether they'd like to go first or second
//   Game.prototype.goFirstOrSecond = function(){
//     var first = prompt("Would you like to go first or second?  Type a 1 and enter if you'd like to go first");
//     if(first != 1){
//        match.cpuMove();
//     }
//     difficulty = prompt("Please enter 1 for easy, 2 for medium, and 3 for hard.");
//   };

//   //This method checks to see if the game is over and displays the appropriate message.
//     Game.prototype.check = function(){

//         var won = match.checkWin();

//         if(won == 'X' || won == 'x'){
//             alert("The computer has won!");
//             match.exit();
//             return;
//         }
//         else if(won == 'O' || won == 'o'){
//             alert("You have won!");
//             match.exit();
//             return;
//         }
//         else if(won == "tie"){
//             alert("The game is a tie!");
//             match.exit();
//             return;
//         }
//     };

//     //This method will decide a CPU move
//     Game.prototype.cpuMove = function(){
//     var tempMove = 10;
//     //sets to a default value at random
//         for(var i=0; i < spacesTaken.length; i++){
//             if(spacesTaken[i] === false){
//                 bestMove = i + 1;
//             }
//         }

//     //this step is skipped on medium or easy
//     if(difficulty > 2){
//       //this ensures a decent second move when the user is going first
//       if(spacesTaken[6] == false && spacesTaken[8] == false){
//         bestMove = 7;
//       }
//     }

//     //if the middle square isn't taken, take it
//         if(spacesTaken[4] === false){
//             bestMove = 5;
//         }

//     //these steps are skipped on easy
//     if(difficulty > 1){
//       //see if the player can win the next move
//       tempMove = match.canWin('O', true);
//       if(tempMove != 10){
//         bestMove = tempMove + 1;
//       }

//       //see if the CPU can win the next move
//       tempMove = match.canWin('X', false);
//       if(tempMove != 10){
//         bestMove = tempMove + 1;
//       }
//     }

//     match.draw(bestMove, false);
//         match.doMove(bestMove, false);
//     };

//   //this method will check to see if the cpu can win in the next turn
//   //if there is a winning move, it returns it as an integer; if not, it returns 10
//   Game.prototype.canWin = function(winningChar, isUser){
//     var winPossible;
//     var winningMove = 10;
//     //This will cylce through all possible moves
//     for(var i = 0; i < 8; i++){
//       if(spacesTaken[i] === false){
//         var priorValue = takenBy[i];
//         //for each possible move, check to see if that move will win
//         match.toArray(i, isUser);
//         winPossible = match.checkWin();
//         if(winPossible == winningChar){
//           winningMove = i;
//           spacesTaken[i] = false;
//           takenBy[i] = priorValue;
//           return i;
//         }
//         //remove the move
//         spacesTaken[i] = false;
//         takenBy[i] = priorValue;
//       }
//     }
//     return 10;
//   };

//     var match = new Game();

//     $('div.x').hide("fast");
//     $('div.o').hide("fast");

//     //asks the user if they'd like to go first or second
//     match.goFirstOrSecond();

//     $('div.s1').click(function(){
//         match.doMove(1, true);
//     });
//     $('div.s2').click(function(){
//         match.doMove(2, true);
//     });
//     $('div.s3').click(function(){
//         match.doMove(3, true);
//     });
//     $('div.s4').click(function(){
//         match.doMove(4, true);
//     });
//     $('div.s5').click(function(){
//         match.doMove(5, true);
//     });
//     $('div.s6').click(function(){
//         match.doMove(6, true);
//     });
//     $('div.s7').click(function(){
//         match.doMove(7, true);
//     });
//     $('div.s8').click(function(){
//         match.doMove(8, true);
//     });
//     $('div.s9').click(function(){
//         match.doMove(9, true);
//     });
// });
