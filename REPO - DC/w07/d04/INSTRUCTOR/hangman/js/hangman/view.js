function HangmanView(model) {
  this.model = model;
  this.initialize();
}

HangmanView.prototype = {
  initialize: function() {
    this.uiLetter = document.querySelector('#letter');
    this.uiGuesses = document.querySelector('[data-ui="guesses"]');
    this.uiChances = document.querySelector('[data-ui="chances"]');
    this.uiWord = document.querySelector('[data-ui="word"]');
    this.uiNewGame = document.querySelector('[data-ui="newgame"]');
    this.uiResult = document.querySelector('[data-ui="result"]');

    this.uiLetter.addEventListener('keyup', _.bind(this.onLetter, this));
    this.uiNewGame.addEventListener('click', _.bind(this.onReset, this));
    this.render();
  },

  render: function() {

    var result = '';

    if (!this.model.active) {
      result = 'You '+ (this.model.victory ? 'win!' : 'lose');
    }

    this.uiResult.innerText = result;
    this.uiWord.innerText = this.model.wordDisplay;
    this.uiChances.innerText = this.model.chances;
    this.uiGuesses.innerText = this.model.guesses.join('');
  },

  onLetter: function() {
    var letter = this.uiLetter.value;
    this.uiLetter.value = '';
    this.model.guess(letter);
    this.render();
  },

  onReset: function() {
    this.model.reset();
    this.render();
  }
};