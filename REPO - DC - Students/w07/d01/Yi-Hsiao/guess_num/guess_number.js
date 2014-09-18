// # Guess the number

// - Create a basic "guess my number" game.  The computer will pick a random number between 0 and 10 inclusive.  The user will guess the number until they guess correctly.

// ###Specification:
// - The user should be asked to guess a number
// - If the user's guess is correct, the user should see a congratulatory message
// - If the user's guess is not correct, the user should be asked to guess the number again.

// ###Bonus 1
// - When the user guesses, you should tell them if they guessed too high or too low

// ###Bonus 2
// - When the user guesses the number correctly, tell them how many guesses it took them.

function guessingGame( minNum, maxNum ) {
  this.minNum = minNum;
  this.maxNum = maxNum;
  this.correctNumber = this.getRandomNumber( minNum, maxNum );
  this.guesses = 0;
}

guessingGame.prototype.getRandomNumber = function ( minNum, maxNum ) {
  var range = maxNum - minNum;
  var randomFloat = Math.random() * range + minNum;

  return Math.floor( randomFloat );
};

guessingGame.prototype.play = function() {
  var guess;
  var guessInt;
  var hint;

  while ( guessInt !== this.correctNumber ) {
    guessString = prompt( "Guess a number from " + this.minNum + " to " + this.maxNum );
    guessInt = parseInt( guessString );
    this.guesses++;

    hint = guessInt > this.correctNumber ? "Your guess is too high." : "Your guess is too low.";

    if ( guessInt === this.correctNumber ) {
      console.log( "Congratulations, you picked the right number." );
    } else {
      console.log( hint );
    }
  }

  return this.guesses;
};

var myGame = new guessingGame(0, 10);
myGame.play();
console.log( "You got the correct number in " + myGame.guesses + " tries." );