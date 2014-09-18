angular.module('watch-app', []).controller('commanderSally', ['$scope', function($scope) {
  $scope.number = 0;

  $scope.$watch('watchme', function(newVal, oldVal) {
    $scope.somethingNew = parseInt(newVal, 10) + parseInt(newVal, 10);
    $scope.number += 1;
    console.log($scope.number);
  }); // $scope.watchme

  $scope.$watch('number', function(newVal) {
    console.log("The counter's value is: " + newVal);
    $scope.number++;
  });
}]);
