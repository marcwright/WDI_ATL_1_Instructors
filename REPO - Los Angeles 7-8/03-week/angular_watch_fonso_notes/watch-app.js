angular.module('watch-app',[]).controller('commanderBob', ['$scope', function($scope){
	$scope.watchme = '';
	$scope.$watch('watchme', function(newVal, oldVal){
		alert("Bob noticed a change. \nNew value: " + newVal + "\nOld value: "+ oldVal);
	});
}]);