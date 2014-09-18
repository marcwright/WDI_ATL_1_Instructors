// When "Start" Button is clicked, "Stop Watch" should become "Time elapsed: 0" & increment every second.

var timeElapsed = 0,
  timer = document.getElementById('timer'),
  start = document.getElementById('start'),
  reset = document.getElementById('reset'),
  pause = document.getElementById('pause'),
  timerID;

start.addEventListener('click', function(){ timer.textContent = 'Time Elapsed: ' + timeElapsed;
  var timerID = setInterval(function(){
    timeElapsed ++;
    timer.textConent = 'Time Elapsed: ' + timeElapsed;
  }, 1000);
});


// When "Reset" is clicked, the text should return to "Stop Watch"

// When "Pause" is clicked, the text should say "Time elapsed: 1", but stop incrementing.



