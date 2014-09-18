function HangmanView() {
  this.model = model;
  this.initialize();
}

HangmanView.prototype = {
  initialize: function(){
    this.uiLetter = document.querySelector('#letter');
    this.uiGuesses = document.querySelector('[data-ui="guesses"]');
    this.uiChances = document.querySelector('[data-ui="chances"]');
    this.uiWord = document.querySelector('[data-ui="word"]');
    this.uiResult = document.querySelector('[data-ui="result"]');

    this.uiLetter.addEventListener('keyup', _.bind(this.onLetter, this);
    })
  },

  render: function(){
    this.uiGuesses.innerText = this.model.guesses;
  },

  onLetter: function(){
    this.letter = this.uiLetter.value;
    this.model.guess(letter);
    this.render();
  }
};
