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
    this.uiGiveUp = document.querySelector('[data-ui="giveup"]');

    this.uiLetter.addEventListener('keyup', _.bind(this.onLetter, this));
    this.uiGiveUp.addEventListener('click', _.bind(this.onGiveUp, this));

    },

    render: function () {
      this.guesses.innerText = this.model.guesses;
    },

    onLetter: function () {
      var letter = this.uiLetter.value;
      this.model.guess(letter);
      this.render();
    },

    onGiveUp: function () {
      HangmanView.initialize('one');
    }

};
