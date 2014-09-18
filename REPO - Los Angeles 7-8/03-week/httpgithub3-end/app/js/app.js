'use strict';

// Declare app level module which depends on filters, and services
var githubApp = angular.module('githubApp',[])

// You will never do this ever as a web developer
// This go in production
var githubKey = 'f2188f1b63b64643a079ab0719d3b50259d46147';




githubApp.controller('TeamCtrl', ['$scope', 'TeamService', 'MemberService',
  function($scope, TeamService, MemberService) {

  $scope.team = {};

  TeamService.getTeam().then(function(json){
    $scope.team = json.data;
    $scope.status = json.status;
  });

  $scope.showMore = function(username){
    MemberService.getEvents(username).then(function(json){
      $scope.events = json.data;
      console.log(json.data);
    })
  }

}])

// create factory for the members
githubApp.factory('MemberService', ['$http', function($http){
  var user = {};
  user.getEvents = function(username){
    var url = 'https://api.github.com/users/' + username + '/events?access_token=';
    var endpoint = url + githubKey;
    return $http({ method: 'GET', url: endpoint });
  }
  return user;
}]);
	
// Creating a factory for the team
githubApp.factory('TeamService', ['$http', function($http){
  var Members = {};
  Members.getTeam = function(){
    //created oauth2 token sent as parameter and with pagination: https://developer.github.com/v3/
    var url = 'https://api.github.com/teams/894913/members?per_page=100&access_token=';
    var endpoint = url + githubKey;
    return $http({ method: 'GET', url: endpoint });
  }
  return Members;
}]);




