function TicTacToe() {
  this.reset();
  this.winners = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]];
}

TicTacToe.prototype = {
  unplayedSquares: [],
  playerXSelections: [],
  playerOSelections: [],
  active: true,
  victory: false,

  reset: function() {
    this.unplayedSquares = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    this.playerOSelections = [];
    this.playerXSelections = [];
    this.active = true;
  },

//I am thinking I should be able to pass the player as an argument instead of writing two different functions for X and O.  That was going to be part of refactoring.  Would that be the right approach?
  playerXMove: function() {
    if (!this.active) return;
    play = parseInt(prompt("Player x, pick a square 1-9"));
    this.playerXSelections.push(play);
    console.log(this.playerXSelections);
    for(var i = 0; i < this.unplayedSquares.length; i++) {
      if(play === this.unplayedSquares[i]) {
        game.unplayedSquares.splice(game.unplayedSquares.indexOf(play), 1);
        console.log(this.unplayedSquares);
        this.evaluateXSelections();
      }
    }
    this.playerOMove();
  },

  playerOMove: function() {
    if (!this.active) return;
    play = parseInt(prompt("Player o, pick a square 1-9"));
    this.playerOSelections.push(play);
    console.log(this.playerOSelections);
    for(var i = 0; i < this.unplayedSquares.length; i++) {
      if(play === this.unplayedSquares[i]) {
        game.unplayedSquares.splice(game.unplayedSquares.indexOf(play), 1);
        console.log(this.unplayedSquares);
        this.evaluateOSelections();
      }
    }
    this.playerXMove();
  },

  evaluateOSelections: function() {
    //I realize .join is a sin.  I think the answer would be iteration?
    combo = game.playerOSelections.sort().join('');
    for(var i = 0; i < game.winners.length; i++) {
      if(combo === this.winners[i].join('')) {
        console.log("You win!");
        this.active = false;
      }
    }
  },

  evaluateXSelections: function() {
    combo = game.playerXSelections.sort().join('');
    for(var i = 0; i < game.winners.length; i++) {
      if(combo === this.winners[i].join('')) {
        console.log("You win!");
        this.active = false;
      }
    }
  }




}
