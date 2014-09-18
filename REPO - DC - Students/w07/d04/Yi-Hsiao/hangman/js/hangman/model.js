function Hangman() {
  this.reset();
}

Hangman.prototype = {
  MAX_ATTEMPTS: 6,
  words: ['ruby', 'rails', 'javascript', 'array', 'hash', 'sinatra', 'model', 'controller', 'view', 'authentication', 'capybara', 'jasmine', 'sublime', 'terminal', 'system', 'backbone', 'function', 'prototype', 'documentation', 'development', 'data', 'closure', 'inheritance', 'scope', 'github', 'agile', 'route', 'context', 'deployment', 'database'],
  reset: function() {
    this.word = this.selectRandomWord();
    this.wordDisplay = this.word.split("");

    for ( var i = 0; i < this.wordDisplay.length; i++ ) {
      this.wordDisplay[i] = "";
    }
    this.guesses = [];
    this.active = true;
    this.attemptsLeft = this.MAX_ATTEMPTS;
    this.victory = false;
  },
  selectRandomWord: function() {
    var randomIndex = Math.round( Math.random() * ( this.words.length - 1 ) );
    return this.words[randomIndex];
  },
  hasGuess: function( letter ) {
    return this.guesses.indexOf( letter ) >= 0;
  },
  hasWordLetter: function( letter ) {
    return this.word.indexOf( letter ) >= 0;
  },
  guess: function( letter ) {
    letter = letter.toLowerCase(); // normalize letter

    // if the game is inactive
    // reveal the entire word & return early
    if ( !this.active ) {
      this.WordDisplay = this.word.split("");
      return;
    }

    // if the letter hasn't been guessed yet, update model
    var hasBeenGuessed = this.hasGuess( letter );
    if ( !hasBeenGuessed ) {
      // add letter to guess history
      this.guesses.push( letter );

      var hasLetterInWord = this.hasWordLetter( letter );
      if ( hasLetterInWord ) {
        // if the letter is correctly guessed
        // update the displayed word
        for ( var i = 0; i < this.word.length; i++ ) {
          if ( letter == this.word[i] ) {
            this.wordDisplay[i] = letter;
          }
        }

        // check for win condition
        if ( this.wordDisplay.join("") == this.word ) {
          this.active = false;
          this.victory = true;
        }
      } else {
        // if the letter is incorrectly guessed
        // the guess uses an attempt
        this.attemptsLeft--;

        // check for loss condition
        if ( this.attemptsLeft <= 0 ) {
          this.wordDisplay = this.word.split("");
          this.active = false;
        }
      }
    }
  }
};