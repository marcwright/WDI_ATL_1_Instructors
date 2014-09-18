angular.module('watch-app', []).controller('commanderBob', ['$scope', function($scope) {
  var counter = 0;
  $scope.$watch('watchme', function(newVal, oldVal) {
    $scope.someNewVal = parseInt(newVal, 10) + parseInt(newVal, 10);
    alert("Bob noticed a change.\nNew value: " + newVal + "\nOld value: " + oldVal);
    counter++;
    console.log(counter);
  });
}]);
