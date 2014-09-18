angular.module('tic-tac-toe', []).controller('gameCtrl', ['$scope', function($scope) {

  // setting a default symbol
  $scope.defaultSymbol = '-';

  // setting default board size
  $scope.size = 3;

  // setting default player names
  $scope.players = ['Player 1', 'Player 2'];

  // win counter for players
  $scope.playerwins = [0, 0];

  $scope.currentPlayer = $scope.players[0];

  // function to change the current player
  var changeCurrentPlayer = function() {
    if ($scope.end != true) {
      if ($scope.currentPlayer == $scope.players[0]) {
        $scope.currentPlayer = $scope.players[1];
      } else {
        $scope.currentPlayer = $scope.players[0];
      }
    }
  };

  // modes for winning conditions
  var modes = ['rows', 'cols', 'tlbr', 'trbl', 'tie'];

  // Board creation
  $scope.createBoard = function(size, symbol) {
    // create a tic tac toe board using the argument size for width and height
    // if size is not set, use a 3 by 3 board

    // reset the game
    $scope.end = false;
    $scope.tie = false;

    if (size == null) {
      size = 3;
    }
    if (symbol == null) {
      symbol = '-';
    }
    $scope.board = [];
    for(var i = 0; i < size; ++i) {
      var temp = [];
      for(var j = 0; j < size; ++j) {
        temp.push(symbol); // set field to passed in symbol
      }
      $scope.board.push(temp);
    }
    $scope.boardcreated = true;
    $scope.defaultSymbol = symbol;
  };

  $scope.takefield = function(x, y, symbol) {
    // take the field
    $scope.board[x][y] = symbol;
    console.log($scope.currentPlayer + ' taking ' + x + ' ' + y);

    // check for winning conditions
    for(var i=0; (i != modes.length && $scope.end != true); i++) {
      checkboard(modes[i]);
    }

    // change player if not game over
    if ($scope.end != true) {
      changeCurrentPlayer();
    }
  };

  // test them!!!
  var checkboard = function(mode, r, c) {
    if (mode == 'tie') {
      console.log('checking for a tie');
      for(var i = 0; i != $scope.board.length; ++i) {
        for(var k = 0; k != $scope.board.length; ++k) {
          if ($scope.board[i][k] == $scope.defaultSymbol) {
            return false;
          }
        }
      }
      $scope.end = true;
      $scope.tie = true;
      $scope.boardcreated = false; // resetting the game board
      return true;
    }

    // initial values
    if (r == null) {
      r = 0;
    }
    if ((c == null) && (mode != 'trbl')) {
      c = 0;
    }
    if (mode == null) {
      mode = 'rows';
    }

    if (mode == 'rows') {
      next_field_equal = [r, c+1];
      next_field_not_equal = [r+1, 0];
      x = r;
      y = c;
    }
    else if (mode == 'cols') {
      next_field_equal = [r+1, c];
      next_field_not_equal = [0, c+1];
      x = c;
      y = r;
    }
    else if (mode == 'tlbr') {
      y = r;
      next_field_equal = [r+1, c+1];
    }
    else if (mode == 'trbl') {
      if (c == null) { c = $scope.board.length - 1; }
      y = r;
      next_field_equal = [r+1, c-1];
    }

    // tell me what you do
    console.log('checking row ' + r + ', column ' + c + ', mode ' + mode);

    if (y <= $scope.board.length - 2) {
      if (($scope.board[r][c] == $scope.board[next_field_equal[0]][next_field_equal[1]]) &&  ($scope.board[r][c] != $scope.defaultSymbol)){
        checkboard(mode, next_field_equal[0], next_field_equal[1])
      }
      else if ((mode != 'tlbr') && (mode != 'trbl')) {
        if (x != $scope.board.length - 1) {
          // next row/col
          checkboard(mode, next_field_not_equal[0], next_field_not_equal[1]);
        }
      }
    }
    else if (y == $scope.board.length - 1) {
      // if you've reached the last element in the array, you win!
      console.log('you win! (' + mode + ')');
      $scope.end = true;
      if ($scope.currentPlayer == $scope.players[0]) { // todo: refactoring
        $scope.playerwins[0] += 1;
      } else {
        $scope.playerwins[1] += 1;
      }
      $scope.boardcreated = false; // resetting the game board
    }
  };

  $scope.currentSymbol = function() {
    if ($scope.currentPlayer == $scope.players[0]) {
     return 'X';
    } else {
      return 'O';
    }
  };
}]);
