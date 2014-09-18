var HangmanModel = Backbone.Model.extend({

  defaults: {
    chances: 8,
    gameOver: false,
    guesses: [],
    word: ''
  },

  words: ['ruby', 'rails', 'javascript', 'array', 'hash', 'sinatra', 'model', 'controller', 'view', 'authentication', 'capybara', 'jasmine', 'sublime', 'terminal', 'system', 'backbone', 'function', 'prototype', 'documentation', 'development', 'data', 'closure', 'inheritance', 'scope', 'github', 'agile', 'route', 'context', 'deployment', 'database'],

  reset: function() {
    this.set({
      chances: 8,
      gameOver: false,
      guesses: [],
      word: this.selectRandomWord();
    });
  },

  selectRandomWord: function() {
    var index = Math.round((this.words.length - 1) * Math.random());
    return (this.words[index]).toUpperCase();
  },

  hasWordLetter: function(letter) {
    return this.word.indexOf(letter.toUpperCase()) >= 0;
  },

  hasGuess: function(letter) {
    return this.guesses.indexOf(letter.toUpperCase()) >= 0;
  },

  hasGuessedAllLetters: function() {
    var word = this.get('word');

    for (var i=0; i < word.length; i++) {
      if (!this.hasGuess(word[i])) return false;
    }

    return true;
  },

  guess: function(letter) {
    if (this.get('gameOver')) return;

    if (!this.hasGuess(letter)) {
      this.guesses.push(letter.toUpperCase());

      if (!this.hasWordLetter(letter)) {
        this.chances -= 1;
      }
    }
  },

  getWordDisplay: function() {
    var word = this.get('word');
    var display = '';

    for (var i=0; i < word.length; i++) {
      var hasGuess = this.hasGuess(word[i]);
      display += hasGuess ? this.word[i] : '_';
    }

    return display;
  }
});