'use strict';

// Declare app level module which depends on filters, and services
var githubApp = angular.module('githubApp',[]);

var githubKey = 'a7b5b84fbfb8704bf4a2eff68b2f2f3dd864e892';

githubApp.controller('TeamCtrl', ['$scope','MembersService',function($scope, MembersService){

	$scope.team = {};

	//Angularjs way of doing $promise
	MembersService.getTeam().then(function(json){
		$scope.team = json.data;
		$scope.staus = json.status;
	});

}]);

githubApp.factory('MembersService', ['$http', function($http){

  var Members = {};
 
  Members.getTeam = function(){
    //created oauth2 token sent as parameter and with pagination: https://developer.github.com/v3/
    var url = 'https://api.github.com/teams/894913/members?per_page=100&access_token=';
    var endpoint = url + githubKey;
    return $http({ method: 'GET', url: endpoint });
  };

return Members;

}]);
