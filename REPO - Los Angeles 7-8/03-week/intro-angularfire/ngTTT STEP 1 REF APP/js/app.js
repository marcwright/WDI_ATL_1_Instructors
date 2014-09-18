var TTTApp = angular.module('TTTApp', []);
var TTTApp = angular.module('TTTApp', []);



TTTApp.controller('TTTController', function ($scope) {

  $scope.testString = "Angular source, App, and Controller present" ;

  $scope.cellList = [
  {status: "A"}, 
  {status: "B"}, 
  {status: "C"}, 
  {status: "D"}, 
  {status: "E"}, 
  {status: "F"}, 
  {status: "G"}, 
  {status: "H"}, 
  {status: "I"}
  ]  ;

  $scope.testJS = function() {
    console.log('Correctly accessing JS function.') ;
  } ;

  $scope.playerPicks = function(thisCell) {
    console.log("Cell was: " + thisCell.status) ;
    thisCell.status = "X" ;
    console.log("Cell is now: " + thisCell.status) ;
  } ;


}) ;

