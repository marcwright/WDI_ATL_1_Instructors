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
  reset: function() {
    this.word = this.selectRandomWord();
    this.wordDisplay = '';
    this.active = true;
    this.chances = 8;
    this.guesses = [];
    this.update();
  },
  selectRandomWord: function() {
    var index = Math.round(Math.random() * (this.words.length-1));
    return this.words[index];
  },

  // Check to see if this letter exists within the guesses array:
  hasGuess: function(letter) {
    return this.guesses.indexOf(letter) >= 0;
  },

  // Checks to see if the specified letter exists within the current word:
  hasWordLetter: function(letter) {
    return this.word.indexOf(letter) >= 0;
  },

  // Guess
  guess: function(letter) {
    // Return early
    if (!this.active) return;

      if (letter.length > 1) {
        throw "this is invalid input: it requires only one character.";
      }

      if (!this.hasGuess(letter)) {
        this.guesses.push(letter);

        if (!this.hasWordLetter(letter)) {
          this.chances -= 1;
        }
      }
      this.update();
    },

  update: function() {
    var display = '';
    var lettersMissing = 0;

    for (var i = 0; i < this.word.length; i++) {
      var letter = this.word[i];
      var hasGuess = this.hasGuess(letter);
      // Do we have this letter?
      // If so, display it. Otherwise, fill it in with an "_"
      display += hasGuess ? letter : '_';

      if (!hasGuess) {
        lettersMissing += 1;
      }
    }


    // Is the game active? If so, display the hidden word
    this.wordDisplay = this.active ? display : this.word;

    if(!lettersMissing) {
      this.victory = true;
      this.active = false;
    }
  }
};
