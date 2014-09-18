angular.module("BabyApp", ["firebase"])
	.controller("BabyController", function($scope, $firebase){
		var babyRef = new Firebase("https://glowing-fire-212.firebaseIO.com")

		$scope.issues = $firebase(babyRef);

		$scope.addOne = function(){

		//Add manually using standard JavaScript
		babyRef.push( {title:$scope.title, body:$scope.body} );
		$scope.title = $scope.body = "";

		// 	//Or use AngularFire methods like $add, $remove, $update etc.
		// 	//$scope.chores.$add( {title:$scope.title, body:$scope.body} )

		};

	});