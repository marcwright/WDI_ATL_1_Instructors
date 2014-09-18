'use strict';

angular.module('tictactoe', [
  'tictactoe.controllers',
]);

'use strict';


/* Controllers */
angular.module('tictactoe.controllers', []).controller('gameCtrl', ['$scope', function($scope) {
  $scope.createBoard = function(size, symbol) {
    // create a tic tac toe board using the argument size for width and height
    // if size is not set, use a 3 by 3 board
    // standard symbol is a smiley
    if (size == null) {
      size = 3;
    }
    if (symbol == null) {
      symbol = '☺';
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
  };

  $scope.tellmeaboutyou = function(p, i) {
    alert('I am at row ' + p + ', column ' + i + 'and my value is: ' + $scope.board[p][i]);
  }

  $scope.takefield = function(x, y, symbol) {
    $scope.board[x][y] = symbol;
  }
}]);
