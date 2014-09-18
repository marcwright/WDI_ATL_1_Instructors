// When "Start" Button is clicked, "Stop Watch" should become "Time elapsed: 0" & increment every second.
var startButton = document.getElementById( "start" );
var resetButton = document.getElementById( "reset" );
var pauseButton = document.getElementById( "pause" );
var timer = document.getElementById( "timer" );

var seconds = 0;
var timerID;
startButton.addEventListener( "click", function() {
  timer.textContent = "Time elapsed: " + seconds;

  timerID = setInterval(function() {
    seconds++;
    timer.textContent = "Time elapsed: " + seconds;  
  }, 1000);
});

// When "Reset" is clicked, the text should return to "Stop Watch"
resetButton.addEventListener( "click", function() {
  clearInterval( timerID );
  timer.textContent = "Stop Watch";
  seconds = 0;
});

// When "Pause" is clicked, the text should say "Time elapsed: 1", but stop incrementing.
pauseButton.addEventListener( "click", function() {
  clearInterval( timerID );
});
