

var rock = document.getElementById('rock');
var paper = document.getElementById('paper');
var scissors = document.getElementById('scissors');
var userChoice;
var botChoice;
var choices = ['rock', 'paper', 'scissors'];
var userScore = 0;
var botScore = 0;

rock.onclick = function() {
  play('rock');
}

paper.onclick = function() {
  play('paper');
}

scissors.onclick = function() {
  play('scissors');
}

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
  document.getElementById('humanScore').innerText = userScore;
  document.getElementById('computerScore').innerText = botScore;
}

function updateStatus() {
  document.getElementById('status').innerText = 'You played ' + userChoice + ', bot played ' + botChoice;
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
