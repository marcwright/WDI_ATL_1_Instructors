function HangmanView() {
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
  },

  render: function() {
    var result = ' ';

    if (!this.model.active) {
      result = 'You ' + (this.model.victory ? 'win!' : 'lose');
    }
    this.uiResult.innerText = result;
    this.uiWord.innerText = this,model.wordDisplay;
    this.uiChances.innerText = this.model.chances;
    this.uiGuesses.innerText = this.model.guesses;
  },

  onLetter: function() {
    var letter = this.uiLetter.value;
    this.model.guess(letter);
    this.model.guess(letter);
    this.render();
  }
};
