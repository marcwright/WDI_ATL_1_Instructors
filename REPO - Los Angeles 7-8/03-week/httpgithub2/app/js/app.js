'use strict';

// Declare app level module which depends on filters, and services
var githubApp = angular.module('githubApp',[])

// You will never do this ever as a web developer
// This go in production
var githubKey = 'f2188f1b63b64643a079ab0719d3b50259d46147';

githubApp.controller('TeamCtrl', ['$scope', '$http', function($scope, $http) {

  $scope.team = {};

  $scope.getTeam = function(){
    //created oauth2 token sent as parameter and with pagination: https://developer.github.com/v3/
    var url = 'https://api.github.com/teams/894913/members?per_page=100&access_token=';
    var endpoint = url + githubKey;
    return $http({ method: 'GET', url: endpoint });
  }

  // angularjs way of doing $promise
  // do some cool shit with json data
  $scope.getTeam().then(function(members){
  	$scope.team = members.data;
  	$scope.status = members.status;
  });


}])
	