angular.module('watchme-app', []).controller('watchCtrl', ['$scope', function($scope) {
  $scope.$watch('watchme', function(newVal, oldVal) {
    console.log('the value changed to: ' + newVal);
    console.log('this is the old value: ' + oldVal);
    if (newVal.length % 10 == 0) {
      console.log('the length is: ' + newVal.length);
    }
    console.log('**************************************');
  });
}]);
