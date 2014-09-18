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

<<<<<<< HEAD
  // Selects a random word
=======
>>>>>>> 0aa2eee0f62c0315c98d82d55f5197cb4460a062
  selectRandomWord: function() {
    var index = Math.round((this.words.length-1) * Math.random());
    return this.words[index];
  },

  // Check to see if this letter exists within the guesses array:
  hasGuess: function(letter) {
    return this.guesses.indexOf(letter) >= 0;
  },

<<<<<<< HEAD
  // Checks to see if the specified letter exists within the current word:
=======
>>>>>>> 0aa2eee0f62c0315c98d82d55f5197cb4460a062
  hasWordLetter: function(letter) {
    return this.word.indexOf(letter) >= 0;
  },

<<<<<<< HEAD
  //
  guess: function(letter) {
    if (!this.active) return;

    if (letter.length != 1) {
      throw "this is invalid input: it requires only one character.";
    }

    if (!this.hasGuess(letter)) {
      this.guesses.push(letter);

      if (!this.hasWordLetter(letter)) {
        this.chances -= 1;
      }

      this.update();
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

      if (!hasGuess) {
        lettersMissing += 1;
      }
    }

    this.victory = !lettersMissing;

    if (this.active && this.chances) {
      this.active = !!lettersMissing;
    } else {
      this.active = false;
    }

    // is the game active? if so, display the hidden word. otherwise, show the full word.
    this.wordDisplay = this.active ? display : this.word;
  }

=======
  guess: function(letter) {
    if (letter.length != 1) throw "invalid letter guessed!";

    // ignore guesses in non-active games, repeated guesses
    if (!this.active || this.guesses.indexOf(letter) != -1) return;

    if (!this.hasWordLetter(letter)) this.chances--;
    this.guesses.push(letter);

    this.update();
  },

  update: function() {
    if (!this.active) {
      this.wordDisplay = this.word;
      return;
    }

    // assume victory until proven otherwise
    var won = true;

    this.wordDisplay = "";
    for (var i=0, len=this.word.length; i<len; i++) {
      if ( this.hasGuess(this.word[i]) ) {
        this.wordDisplay += this.word[i];
      } else {
        this.wordDisplay += '_';
        won = false;
      }
    }

    if(won) {
      this.victory = true;
      this.active = false;
    }
  }
>>>>>>> 0aa2eee0f62c0315c98d82d55f5197cb4460a062
};
