function Game() {
	this.board = [
		[0, 0, 0],
		[0, 0, 0],
		[0, 0, 0]
	];
	this.winningPlayer = 0;
	this.turn = 0;
}

Game.prototype.registerMove = function(row,column) {
	if (this.board[row][column] === 0){
		if (this.turn % 2 === 0) {
			this.board[row][column] = 1;
		} else {
			this.board[row][column] = -1;
		}
		this.turn++;
	}
}

Game.prototype.checkRows = function() {
	for (var r=0; r < this.board.length; r++) {
		var row_sum = this.board[r][0] + this.board[r][1] + this.board[r][2];
		if(row_sum === 3) {
			this.winningPlayer= 1;
			return true;
		} else if (row_sum === -3) {
			this.winningPlayer= 2;
			return true;
		}
	}
	return false;
}

Game.prototype.checkCols = function() {
	for (var c=0 ; c < this.board.length; c++) {
		var col_sum = this.board[0][c] + this.board[1][c] + this.board[2][c];
		if(col_sum === 3) {
			this.winningPlayer= 1;
			return true;
		} else if (col_sum === -3) {
			this.winningPlayer= 2;
			return true;
		}
	}
	return false;
}

Game.prototype.checkDiag = function() {
	var diag_sum1 = this.board[0][0] + this.board[1][1] + this.board[2][2];
	var diag_sum2 = this.board[2][0] + this.board[1][1] + this.board[0][2];

	if(diag_sum1 === 3 || diag_sum2 == 3) {
		this.winningPlayer= 1;
		return true;
	} else if (diag_sum1 === -3 || diag_sum2 == -3) {
		this.winningPlayer= 2;
		return true;
	} else {
		return false;
	}
}

Game.prototype.checkWin = function() {
	if (this.checkRows() || this.checkCols() || this.checkDiag() ){
		alert('Player ' + this.winningPlayer + ' wins!');
	} else if (this.turn >= 9) {
		alert("Womp womp it's a tie!");
	}
}

window.game = new Game();

function playController() {
	game.registerMove(this.id[1], this.id[3]);
	if(game.turn % 2 === 0) {
		this.style.backgroundColor="black";
	} else {
		this.style.backgroundColor="red";
	}
	game.checkWin();
}

window.onload = function() {
	var boxes = document.getElementsByClassName("box_cell");

	for( var i = 0; i < boxes.length; i++ ){
		boxes[i].addEventListener('click', playController.bind(boxes[i]), false);
	}
};