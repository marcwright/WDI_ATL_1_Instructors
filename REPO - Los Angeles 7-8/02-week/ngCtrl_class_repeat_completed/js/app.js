var coffeeApp = angular.module('CoffeeShopApp', []);

coffeeApp.controller('coffeeController', function ($scope) {

	$scope.shopName = "Barista lovers <3 ";

	$scope.showTitle = function(){
		if ($scope.shopName.length > 5 ) {
			return true;
		} else {
			return false;
		}

	};

	$scope.teams = [
		{name: {
			nick: 'asdf',
			full: "asdf asdf"}
		},
		{name: 'seahawks'},
		{name: 'chargers'}
	]

	$scope.toasty = function(roast){
		if (roast > 7) {
			return true;
		}
		else {
			return false;
		}
	}

	$scope.showDiscount= function(price){
		if (price > 9 ) {
			$scope.message = "hey you're getting ripped off";
			return true;
		} else {
			return false;
		}
	}


	$scope.puppyClick = function(coffee) {

		if (coffee.showPuppy == false) {
			coffee.showPuppy = true; 
			coffee.puppy = 'http://sprudge.com/wp-content/uploads/2013/09/puppy-coffee-1.jpg';
		} else {
			coffee.showPuppy = false;
		}
		
	}

	$scope.coffees = [
		{
			name: 'decaf',
			roastLevel: 8,
			origin: 'South America',
			image: "images/coffee1.jpg",
			showPuppy: false,
			price: 3,
			quantity: 0
		},
		{
			name: 'espresso',
			roastLevel: 6,
			origin: 'Hawaii',
			image: "images/coffee2.jpg",
			showPuppy: false,
			price: 10,
			quantity: 1000
		},
		{
			name: 'double shot of espresso',
			roastLevel: 6,
			origin: 'Hawaii',
			image: "images/coffee3.jpg",
			price: 20,
			quantity: 24 
		},
		{
			name: 'cappuccino',
			roastLevel: 6,
			origin: 'Hawaii',
			image: "images/coffee3.jpg",
			price: 7,
			quantity: 0
		}
	]

});
