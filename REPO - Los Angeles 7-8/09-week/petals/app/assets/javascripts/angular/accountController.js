accountManager.controller('AccountCtrl',
			['$scope', 'Account',
	function($scope, Account){

		Account.query(function(json){
			$scope.accounts = json;
		})


	}]);