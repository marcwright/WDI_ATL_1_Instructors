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

  // Select a new random word, and reset game state.
  // Resets the game state
  // Gives fersh values to all state attributes.
  reset: function() {
    this.word = this.selectRandomWord();
    this.wordDisplay = '';
    this.active = true;
    this.chances = 8;
    this.guesses = [];
    this.update();
  },

  // Selects a random word
    //Selected a random word from our words array and made that the current word.
  selectRandomWord: function() {
    var index = Math.round((this.words.length-1) * Math.random());
    return this.words[index];
  },

  // Check to see if this letter exists within the guesses array:
    // Checks to see if this letter exist in our array of guesses
  hasGuess: function(letter) {
    return this.guesses.indexOf(letter) >= 0;
  },

  // Checks to see if the specified letter exists within the current word:

  hasWordLetter: function(letter) {
    return this.word.indexOf(letter) >= 0;
  },

  // Receives a letter into the game
  guess: function(letter) {
    // Checks to see if the game is inactive, if it is. Just skipp the rest of this function.
    if (!this.active) return;

    // Validates the input is the proper length
    if (letter.length > 1) {
      throw "this is invalid input: it requires only one character.";
    }
    // If the letrer has not yet been guessed.
    if (!this.hasGuess(letter)) {
      // Pushes the new letter guessed into the guessed array.
      this.guesses.push(letter);

      // Checks to see if the letter inputted is in the word, if it isn't it reduces your number of chances by one.
      if (!this.hasWordLetter(letter)) {
        this.chances -= 1;
      }

      // Calls the update function to reassess the game STATE
      this.update();
    }
  },

  // When called will reassess the game STATE
  update: function() {
    // Builds out the word we want to display, including underscores.
    var display = '';
    var lettersMissing = 0;


    for (var i=0; i < this.word.length; i++) {

      var letter = this.word[i];
      var hasGuess = this.hasGuess(letter);

      // do we have this letter?
      // if so, display it.
      // otherwise, fill it in with an "_"
      display += hasGuess ? letter : '_';

      // Count the number of missing letters to see if we are waiting on any more.
      if (!hasGuess) {
        lettersMissing += 1;
      }
    }

    // If there are no letters missing, you're a winner!
    this.victory = !lettersMissing;

    // Magic
    // !! operator forces somethign to have a boolean value.
    if (this.active && this.chances) {
      this.active = !!lettersMissing;
    } else {
      this.active = false;
    }

    // is the game active? if so, display the hidden word. otherwise, show the full word.
    this.wordDisplay = this.active ? display : this.word;
  }

};
