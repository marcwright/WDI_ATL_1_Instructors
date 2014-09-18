$(function() {

  var choices = ['rock', 'paper', 'scissors'];
  var userChoice;
  var botChoice;
  var userScore = 0;
  var botScore = 0;

  $('button').click(function() {
    userChoice = $(this).attr('id');
    play(userChoice);
  });

  function play(userPlay) {
    userChoice = userPlay;
    botsPlay();
    evaluate();
    updateScoreBoard();
    updateStatus();
  }

  function botsPlay() {
    var index = Math.floor(Math.random() * choices.length);
    botChoice = choices[index];
  }

  function updateScoreBoard() {
    $('#humanScore').text(userScore);
    $('#computerScore').text(botScore);
  }

  function updateStatus() {
    $('#status').text('You played ' + userChoice + ', bot played ' + botChoice) ;
  }

  function evaluate() {
    switch ( userChoice ) {
      case "rock":
      if (botChoice == "paper") {
        botScore++;
      } 

      if ( botChoice == 'scissors') {
        userScore++;
      }
      break;

      case "paper":
      if (botChoice == "rock") {
        userScore++;
      } 

      if ( botChoice == 'scissors') {
        botScore++;
      }
      break;

      case "scissors":
      if (botChoice == "paper") {
        userScore++;      
      } 

      if ( botChoice == 'rock') {
        botScore++;
      }
      break;
    }

  }

});
