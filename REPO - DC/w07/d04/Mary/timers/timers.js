// When "Start" Button is clicked, "Stop Watch" should become "Time elapsed: 0" & increment every second.
var startButton = document.getElementById('start');
var timerText = document.getElementById('timer');
var num = 0;
var timerId;

startButton.addEventListener('click', function() {
  timerText.textContent = "Time elapsed: " + num;
  timerId = setInterval(function() {
    num++;
    timerText.textContent = "Time elapsed: " + num;
  } ,1000);
});

// When "Reset" is clicked, the text should return to "Stop Watch"
var resetButton = document.getElementById('reset');

resetButton.addEventListener('click', function() {
  clearInterval(timerId);
  timerText.textContent = "Stop Watch";
});

// When "Pause" is clicked, the text should say "Time elapsed: 1", but stop incrementing.
var pauseButton = document.getElementById('pause');

pauseButton.addEventListener('click', function() {
  clearInterval(timerId);
});

