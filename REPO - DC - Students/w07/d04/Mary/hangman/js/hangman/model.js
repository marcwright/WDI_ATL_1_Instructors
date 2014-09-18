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

  // select a new random word and reset game state
  reset: function() {
    this.word = this.selectRandomWord();
    this.active = true;
    this.chances = 8;
    this.wordDisplay = '';
    this.guesses = [];
    this.update();
  },

  selectRandomWord: function() {
    // gives us a random index from the above array
    var index = Math.round( (this.words.length - 1) * Math.random());
    return this.words[index];
  },

  hasGuess: function(letter) {
    //check to see if this letter exists within guesses
    return this.guesses.indexOf(letter) >= 0;
  },

  // check to see if this letter exists in the word
  hasWordLetter: function(letter) {
    return this.word.indexOf(letter) >= 0;
  },

  //
  guess: function(letter) {
    if(!this.active) return;

    if(letter.length > 1) {
      throw "this is invalid input";
    };

    if(!this.hasGuess(letter)) {
      this.guesses.push(letter);

      if( !this.hasWordLetter(letter)) {
        this.chances -= 1;
      };
      this.update();
    };
  },

  update: function() {
    var display = '';
    var lettersMissing = 0
    for (var i = 0; i < this.word.length; i++) {
      var letter = this.word[i];
      var hasGuess = this.hasGuess(letter);
      display += hasGuess ? letter : '_';
      if(!hasGuess) {
        lettersMissing += 1;
      };
    };
    this.wordDisplay = this.active ? display: this.word;
    this.victory = (lettersMissing === 0);
    this.active = !(lettersMissing === 0 );
  }


};
