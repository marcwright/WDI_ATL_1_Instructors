var TTTApp = angular.module('TTTApp', ["firebase"]);
 //   1                        2

 TTTApp.controller('TTTController', function ($scope, $firebase) {
// 3

  // ABOVE: Just make 1, 2, & 3 the same, and on the index.html make sure you have
  // <html x-ng-app="TTTApp">  where it says "TTTApp" matches too.  You don't have to 
  // use TTTApp, but use the same name in all 4 places.
  // (Some of these can actually different from each other but this works.)

  // The next statment creates a connection from your app to Firebase.  There is not yet anything in
  // the app using this connection, but this is where you create the first 1/2 of the connection:

  // This creates a pointer: remoteGameContainer that points to the Firebase database and specifies a data
  // branch named "databaseGameContainer".  You can use whatever name you want - it will be used over on Firebase.

  $scope.remoteGameContainer = 
  $firebase(new Firebase("https://tttbyrichard.firebaseIO.com/databaseGameContainer")) ;
  // Don't forget to change "tttbyrichard" to your Firebase app name.

  $scope.clickCount = 0 ;

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

  // This container object is what gets synced:
  $scope.gameContainer = {
    cellListArray: $scope.cellList,
    clickCounter: $scope.clickCount
  } ;

  // Everywhere else in your program, use $scope.gameContainer.cellListArray instead of cellList.
  // Everywhere else in your program, use $scope.gameContainer.clickCounter instead of clickCount.
  // Make that change in your ng-repeat as well and anywhere in your index.html as needed.


  // remoteGameContainer: that is the name you gave the Firebase node (looks like a folder in Firebase).
  // The bind statement creates a connection between anything in your app and the Firebase connection we just created.
   
  $scope.remoteGameContainer.$bind($scope, "gameContainer") ;

 // The bind statement will automatically update your model, in this case cellList, whenever it 
  // changes on Firebase.  But this will not trigger an Angular update of the interface (index.html)
  // - we've been relying on the ng-click to wake up Angular and get the gameboard refreshed.
  // So we put a watch on cellList - this tells Angular to refresh the interface elements, ie ng-class,
  // whenever the model, in this case celList, changes.
  $scope.$watch('gameContainer', function() {
    console.log('gameCountainer changed!') ;
  }) ;

  // FIREBASE TESTING ONLY:
  $scope.nakedArrayOfStrings = ["A", "B", "C"] ;
  $scope.nakedArrayOfIntegers = [1,2,3] ;
  $scope.nakedArrayOfMixedTypes = [3, 3.17, "pi"] ;
  $scope.remoteArrayOfStringsContainer = $firebase(new Firebase("https://tttbyrichard.firebaseIO.com/remoteArrayOfStrings"));
  $scope.remoteArrayOfIntegersContainer = $firebase(new Firebase("https://tttbyrichard.firebaseIO.com/remoteArrayOfIntegers"));
  $scope.remoteArrayOfMixedTypesContainer = $firebase(new Firebase("https://tttbyrichard.firebaseIO.com/remoteArrayOfMixedTypes"));
  $scope.remoteArrayOfStringsContainer.$bind($scope, "nakedArrayOfStrings") ;
  $scope.remoteArrayOfIntegersContainer.$bind($scope, "nakedArrayOfIntegers") ;
  $scope.remoteArrayOfMixedTypesContainer.$bind($scope, "nakedArrayOfMixedTypes") ;

  $scope.testString = "Angular source, App, and Controller are present" ;

  // =================================================================================================

  // When the user clicks a cell.
  $scope.playerPicks = function(thisCell) {
    console.log("Cell was: " + thisCell.status) ;
    //  You need to come up with a way to set this to "O" when player 2 has a turn.
    thisCell.status = "X" ;
    console.log("Cell is now: " + thisCell.status) ;

    // This updates the live click counter.  Not needed unless you want it, but it's also convenient
    // to see if your model is connected properly.
    console.log("clickCounter was:") ;
    console.log($scope.gameContainer.clickCounter) ;
    $scope.gameContainer.clickCounter = $scope.gameContainer.clickCounter + 1 ;
    console.log("clickCounter was:") ;
    console.log($scope.gameContainer.clickCounter) ;
  } ;

  // This is for that javascript test button.  This lets you test if you are calling this JS function when you
  // click it.  If you mess up this file, like even have an extra or missing ; or } below, then your
  // clicks may not be connecting like you think.
  $scope.testJS = function() {
    console.log('Correctly accessing JS function.') ;
  } ;

 // Firebase testing only:
  $scope.testFB = function() {
    console.log("New array value: " + $scope.nakedArrayOfIntegers[0].toString()) ;
    $scope.nakedArrayOfIntegers[0] = $scope.nakedArrayOfIntegers[0] + 1 ;
    console.log("New array value: " + $scope.nakedArrayOfIntegers[0].toString()) ;
  }
}) ;
