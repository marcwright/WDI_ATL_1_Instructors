function TicTacToe() {
  this.board = [new Array(3), new Array(3), new Array(3)];
  this.xMove = true; // is it X's move?
  this.activeGame = true;
}

TicTacToe.prototype = {
  gridSize: 3,
  placeMarker: function( xCoord, yCoord ) {
    // return early if the game is over
    if ( !this.activeGame ) return;

    var coordinates = [xCoord, yCoord];

    // check if marker is within the bounds of the grid
    var withinGrid = true;
    for ( var i = 0; i < coordinates.length; i++ ) {
      var coordinate = coordinates[i];
      if ( coordinate >= this.gridSize || coordinate < 0 ) {
        withinGrid = false;
        break;
      }
    }

    // only add markers if it's within the grid and there is no marker there already
    if ( withinGrid && !this.board[yCoord][xCoord] ) {
      this.board[yCoord][xCoord] = this.xMove ? "X" : "O";
      this.xMove = !this.xMove;  // switch markers after every move;
    }

    this.gameWon = this.checkWin();
    if ( this.gameWon ) this.activeGame = false;
  },
  checkWin: function() {
    // check for horizontal or vertical win conditions
    var winConditions = ["horizontal", "vertical"];

    for ( var i = 0; i < winConditions.length; i++ ) {
      // determine search type
      var isHorizontalSearch = winConditions[i] == "horizontal";

      for ( var j = 0; j < this.gridSize; j++ ) {
        var markerType = "";  // reset marker for each search

        for ( var k = 0; k < this.gridSize; k ++ ) {
          var row = isHorizontalSearch ? j : k;
          var col = isHorizontalSearch ? k : j;

          markerType = markerType || this.board[row][col];

          // end search prematurely if there are no markers or markers do not match
          if ( !markerType || this.board[row][col] !== markerType ) break;

          // if there are 3 markers of the same type in a row, return true
          if ( k === this.gridSize - 1 ) return true;
        }
      }
    }

    // conduct a diagonal search
    var diagonalConditions = ["down-right", "up-right"];

    for ( var i = 0; i < diagonalConditions.length; i++ ) {

      // set diagonal search type, downright (0,0; 1,1; 2,2) or upright (0,2; 1,1; 2,0)
      var isDownRightSearch = diagonalConditions[i] == "down-right";
      var markerType = ""; // reset markerType for each search type

      var lastIndex = this.gridSize - 1;
      for ( var j = 0; j < this.gridSize; j++ ) {
        var row = isDownRightSearch ? j : lastIndex - j;
        var col = isDownRightSearch ? j : j;
        markerType = markerType || this.board[row][col];

        if ( !markerType || this.board[row][col] !== markerType ) break;

        if ( j === lastIndex ) return true;
      }

    }

    return false;
  }
};