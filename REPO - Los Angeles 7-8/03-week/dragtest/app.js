var app = angular.module('dragging', ['ngDragDrop']);

app.controller('dragCtrl', ['$scope', function($scope) {
  $scope.leftboxcol = [2, 3, 4, 5, 6, 7, 8, 9];
  $scope.rightboxcol = [1];

  $scope.dropSuccessHandler = function(event, index, array){
    array.splice(index, 1);
  };

  $scope.onDrop = function(event, data, array) {
    array.push(data);
  };

  $scope.test = function() { alert('test test test'); };
}]);
