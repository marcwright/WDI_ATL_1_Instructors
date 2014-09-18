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
  },

  // Selects a random word
  selectRandomWord: function() {
    var index = Math.round((this.words.length-1) * Math.random());
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

  //
  guess: function(letter) {
    if (!this.active) return;

    if (letter.length > 1) {
      throw "this is invalid input.";
    }

    if (!this.hasGuess(letter)) {
      this.guesses.push(letter);

      if (!this.hasWordLetter(letter)) {
        this.chances -= 1;
      }
    }

  },

    update: function() {

    var display = '';
    var lettersMissing = 0;

    for (var i=0; i < this.word.length; i++) {
      // do we have this letter?
      // if so, display it.
      // otherwise, fill it in with an "_"

      var letter = this.word[i];
      var hasGuess = this.hasGuess(letter);
      display += hasGuess ? letter : '_';

      if(!hasGuess) {
        lettersMissing += 1;
      }
    }
    this.victory = (lettersMissing === 0);
    this.active = (lettersMissing !== 0);
    //is the game active? if so, display the hidden word, otherwise, don't.
    this.wordDisplay = this.active ? display : this.word;
  }

};
