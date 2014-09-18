function Tictactoe() {
  this.reset();
}

Tictactoe.prototype = {
//why is var = ... syntax not used in prototype?

  squares: document.querySelectorAll(".board button"),
  players: ["X", "O"],
  currentTurn: 0,
  active: true,
  //victory: false,
  display: document.querySelector(".gameActionDisplay"),

  reset: function() {
    this.display.innerText = 'make your move Mr. ' + this.players[this.currentTurn];

    for (var i = 0; i < this.squares.length; i++) {
      this.squares[i].addEventListener('click', function() {
        if () {
          debugger;
          return
        }
        //TODO: write function
        else if (!isValid(this.squares[i])) {

        } else {
          this.innerText = Tictactoe.prototype.players[Tictactoe.prototype.currentTurn];

          //TODO: write this function
          //active = checkForWinners(squares, players, currentTurn);

          //game is over (somone won)

          //game is over (draw)

          //game is not over yet (continue playing)
          currentTurn++;
          currentTurn = currentTurn % 2;
        }
      })
    }
  },

  isValid: function(button) {
    return button.innerText.length === 0;
  },

  checkForWinners: function() {}

};
