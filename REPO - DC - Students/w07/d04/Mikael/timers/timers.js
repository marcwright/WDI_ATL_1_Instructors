// When "Start" Button is clicked, "Stop Watch" should become "Time elapsed: 0" & increment every second.
var start = document.getElementById('start');
var timer = document.getElementById('timer');
var reset = document.getElementById('reset');
var pause = document.getElementById('pause');

var seconds = 0;
var timerID;

start.addEventListener('click', function() {
  timer.textContent = 'Time Elapsed: ' + seconds;
  timerID = setInterval(function() {
    seconds++;
    timer.textContent = 'Time Elapsed: ' + seconds;
  }, 1000)
});

// When "Reset" is clicked, the text should return to "Stop Watch"
reset.addEventListener('click', function() {
  clearInterval(timerID);
  timer.textContent = "Stop Watch";
  seconds = 0;
});

// When "Pause" is clicked, the text should say "Time elapsed: 1", but stop incrementing.
pause.addEventListener('click', function(){
  clearInterval(timerID);
})


