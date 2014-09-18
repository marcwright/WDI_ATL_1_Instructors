'use strict';

// Declare app level module which depends on filters, and services
var githubApp = angular.module('githubApp',[])

// You will never do this ever as a web developer
// This go in production
var githubKey = '4f942039e9f7025627602b24ec30cb90970d4a93';

githubApp.controller('UserCtrl', ['$scope', 'MemberService',
  function($scope, MemberService){

    $scope.current_user = '';

    MemberService.getUser().then( function(json){
      $scope.current_user = json.data.name;
      console.log(json.data);
    });

    $scope.changeName = function(inputName){

      var obj = {name: inputName};

      MemberService.updateUser(obj).then( function(json){
        $scope.current_user = json.data.name;
        console.log(json.data);
      });  

    }

}])

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
  };

  user.getUser = function(){
    var url = 'https://api.github.com/user?access_token='
    var endpoint = url + githubKey;
    return $http({ method: 'GET', url: endpoint });
  };

  user.updateUser = function(obj){

    var dataObj = obj // {name: ''}
    var url = 'https://api.github.com/user?access_token='
    var endpoint = url + githubKey;
    return $http({ method: 'PATCH', url: endpoint, data: dataObj });
  };

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




