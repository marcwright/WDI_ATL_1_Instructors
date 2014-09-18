var coffeeApp = angular.module('CoffeeShopApp', []);

coffeeApp.controller('coffeeController', function ($scope) {

	$scope.coffees = [
		{
			name: 'decaf',
			roastLevel: 8,
      origin: 'South America',
			image: "images/coffee1.jpg",
		},
		{
			name: 'espresso',
			roastLevel: 6,
      origin: 'Hawaii',
			image: "images/coffee2.jpg",
		},
		{
			name: 'double shot of espresso',
			roastLevel: 6,
      origin: 'Hawaii',
			image: "images/coffee3.jpg",
		},
		{
			name: 'cappuccino',
			roastLevel: 6,
      origin: 'Hawaii'
		}
	]
});
