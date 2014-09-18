var game = new Game();

function render() {
  var board = document.querySelector("ul.board");

  // clear board of content
  board.innerHTML = "";

  for (var i = 0; i < 9; i++) {
    var li = document.createElement("li");
    li.className = game.board[parseInt(i/3)][i%3];
    board.appendChild(li);
  }

  if(game.checkWinner() !== undefined) {
    var winners = document.querySelectorAll("."+ game.checkWinner());
    for(i = 0; i < winners.length; i++){
      // this adds a flashy animation to the winning board pieces
      winners[i].classList.add("winning");
    }
  }

}

document.querySelector('ul').addEventListener('click', function(e){
  for(var i = 0; i < e.target.parentElement.children.length; i++) {
    if(e.target === e.target.parentElement.children[i]) {
      // make the mark with the appropriate symbol
      game.mark(game.turn, { row: parseInt(i/3), column: i%3 });
      render();                         // ^ i will be a number between 0 - 8
    }
  }
});

render();
