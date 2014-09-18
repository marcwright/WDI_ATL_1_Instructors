function Hangman() {
  this.reset();
}

Hangman.prototype = {
  words: ['ruby', 'rails', 'javascript', 'array', 'hash', 'sinatra', 'model', 'controller', 'view', 'authentication', 'capybara', 'jasmine', 'sublime', 'terminal', 'system', 'backbone', 'function', 'prototype', 'documentation', 'development', 'data', 'closure', 'inheritance', 'scope', 'github', 'agile', 'route', 'context', 'deployment', 'database'],
  word: '',
  wordDisplay: '',
  chances: 8,
  guesses: [],
  active: true,
  victory: false,

  // Select a new random word, and reset game state.
  // Gives fresh values to all state attributes
  reset: function() {
    this.word = this.selectRandomWord();
    this.wordDisplay = '';
    this.active = true;
    this.chances = 8;
    this.guesses = [];
    this.update();
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

  //Recieves a lette rinto the game
  guess: function(letter) {
    if (!this.active) return;
    // If the game is over, then don't run the rest of this function
    if (letter.length != 1) {
      throw "this is invalid input.";
    }
    // Validate that we actually want this letter.
    if (!this.hasGuess(letter)) {
      this.guesses.push(letter);

      //Iq
      if (!this.hasWordLetter(letter)) {
        this.chances -= 1;
      }
      //Call update to reassesses the game state
      this.update();
    }
  },
    //Call update to reassesses the game state
  update: function() {

    // We need to build out the word we want to display, including underscores:
    var display='';
    lettersMissing = 0;

    for(var i = 0; i < this.word.length; i++){
      // do we have thsi letter?

      var letter = this.word[i];
      var hasGuess = this.hasGuess(letter);

      // if so, display it.
      //otherwise, fill it in with "_"
      display += hasGuess ? letter : '_';

      //count the number of missing letters to see if we're waiting on any:
      if (!hasGuess){
        lettersMissing += 1;
      }
    }

    // If there are no letters missing, you're a winner!
    this.victory = !lettersMissing;


    if(this.active && this.chances) {
      this.active = !!lettersMissing;
    } else{
      this.active = false;
    }

    //is the game active? if so, display the hidden word, otherwise show full word.
    this.wordDisplay = this.active ? display : this.word;
  }

};
