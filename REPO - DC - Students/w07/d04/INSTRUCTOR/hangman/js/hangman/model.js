function Hangman() {
  this.reset();
}

Hangman.prototype = {
  words: ['ruby', 'rails', 'javascript', 'array', 'hash', 'sinatra', 'model', 'controller', 'view', 'authentication', 'capybara', 'jasmine', 'sublime', 'terminal', 'system', 'backbone', 'function', 'prototype', 'documentation', 'development', 'data', 'closure', 'inheritance', 'scope', 'github', 'agile', 'route', 'context', 'deployment', 'database'],
  word: '',
  wordDisplay: '',
  chances: 0,
  guesses: [],
  active: true,
  victory: false,

  // - Resets the game state.
  // - Gives fresh value to all state attributes.
  reset: function() {
    this.word = this.selectRandomWord();
    this.wordDisplay = '';
    this.active = true;
    this.chances = 8;
    this.guesses = [];
    this.update();
  },

  // Selected a random word from the list of words.
  selectRandomWord: function() {
    var index = Math.round((this.words.length-1) * Math.random());
    return this.words[index];
  },

  // Checks to see if this letter exists in our current list of guesses.
  hasGuess: function(letter) {
    return this.guesses.indexOf(letter) >= 0;
  },

  // Checks to see if the specified letter exists within the current word.
  hasWordLetter: function(letter) {
    return this.word.indexOf(letter) >= 0;
  },

<<<<<<< HEAD
  //
=======
  // Recieves a letter into the game,
>>>>>>> 237bfdefec1527c1b8fa2bffc69016c73516271b
  guess: function(letter) {

    // If the game is over, then don't run the rest of this function.
    if (!this.active) return;

    // Validate that we actually want this letter.
    if (letter.length != 1) {
      throw "this is invalid input: it requires only one character.";
    }

    // If the letter has not yet been guessed...
    if (!this.hasGuess(letter)) {

      // Let's add the letter into the guesses array.
      this.guesses.push(letter);

      // If your guess is not within the word,
      // we take away one of your chances.
      if (!this.hasWordLetter(letter)) {
        this.chances -= 1;
      }

      // Call update to reasses the game state.
      this.update();
    }
  },

  // Reassesses the complete game state:
  update: function() {

    // We need to build out the word we want to display, including underscores:
    var display = '';
    var lettersMissing = 0;


    for (var i=0; i < this.word.length; i++) {
      // do we have this letter?

      var letter = this.word[i];
      var guessIsPresent = this.hasGuess(letter);

      // if present, display it. otherwise, fill it in with an "_"
      display += guessIsPresent ? letter : '_';

      // Count the number of missing letters to see if we're waiting on any:
      if (!guessIsPresent) {
        lettersMissing += 1;
      }
    }

    // If there are no letters missing, you're a winner!
    this.victory = !lettersMissing;

    
    if (this.active && this.chances) {
      this.active = !!lettersMissing;
    } else {
      this.active = false;
    }

<<<<<<< HEAD
  },

  update: function() {
    var display = '';
    for (var i = 0; i < this.word.length; i++) {
      var letter = this.word[i];
      var hasGuess = this.hasGuess(letter);
      display += hasGuess ? letter : '_';
    }
    this.wordDisplay = display;
=======
    // is the game active? if so, display the hidden word. otherwise, show the full word.
    this.wordDisplay = this.active ? display : this.word;
>>>>>>> 237bfdefec1527c1b8fa2bffc69016c73516271b
  }

};
