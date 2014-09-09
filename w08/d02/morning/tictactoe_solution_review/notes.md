###Tic Tac Toe Review

I start by creating a constructor function for a game.
```javascript
function Game(){
  this.player1Turn = true;
  this.active = true;
  this.board = {
    row1: [null, null, null],
    row2: [null, null, null],
    row3: [null, null, null]
  };
}

Game.prototype.togglePlayer = function(){
  this.player1Turn = !this.player1Turn;
};

Game.prototype.endGame = function(){
  this.active = false;
};
```
