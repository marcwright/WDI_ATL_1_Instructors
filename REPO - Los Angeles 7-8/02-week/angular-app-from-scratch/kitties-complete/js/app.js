var kittiesApp = angular.module('kittiesApp', []);  // This is our Angular app module (modules are 	containers for the various parts of an Angular app). We named our app kittiesApp, and will bootstrap it in index.html with the ng-app directive. The empty array means that this module doesn't depend on any other modules (if it did, we'd list them there). Only one app module is permitted, so kittiesApp is it.

kittiesApp.controller('KittiesController', function ($scope) { 

// We're naming this controller KittiesController, which we can see in that first argument. We are allowed to have many controllers if we want to, and can bind them to different parts of our view. The function($scope) allows us to set the initial state of our scope -- in this case, we're declaring $scope.kitties below. If our users manipulate this app, $scope.kitties will change.

	$scope.kitties = [ // an array of objects, each with 5 properties
		{
			catName: 'Karl', // for display in the view with {{k.catName}}
			monthsOld: 5, // for display in the view with {{k.monthsOld}}
			gender: 'boy', // for display in the view with {{k.gender}}
			image: "images/carl.png", // path to the kitten's image, displayed in the view with <img x-ng-src={{k.image}}>
			adopted: false // boolean to separate adopted and available kittens via filter
		},
		{
			catName: 'Jack',
			monthsOld: 4,
			gender: 'boy',
			image: "images/jack.png",
			adopted: false
		},
		{
			catName: 'Oscar',
			monthsOld: 2,
			gender: 'boy',
			image: "images/oscar.png",
			adopted: true
		},
		{
			catName: 'Princess Mew',
			monthsOld: 3,
			gender: 'girl',
			image: "images/princessmew.png",
			adopted: false
		}
	] // end of kitties array

}); // end of controller 



