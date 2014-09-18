// When "Start" Button is clicked, "Stop Watch" should become "Time elapsed: 0" & increment every second.

// When "Reset" is clicked, the text should return to "Stop Watch"

// When "Pause" is clicked, the text should say "Time elapsed: 1", but stop incrementing.

var start = document.getElementById("start");
var title = document.getElementById("timer");
var reset = document.getElementById("reset");
var pause = document.getElementById("pause");

var seconds = 0;
var timerID;

function updateTime(){
  seconds++;
  title.textContent = "Time Elapsed: " + seconds;
}

// on click we update the text field with 'Time Elapsed: 0'
start.addEventListener("click", function(){
  title.textContent = 'Time Elapsed: ' + seconds;
  timerID = setInterval(updateTime, 1000);
});

function resetTextAndClearInterval(){
  title.textContent = "Stop Watch";
  clearInterval(timerID);
  // we need to reset the seconds to zero, so that when we press start the time doesn't start at 3
  seconds = 0;
}

reset.addEventListener("click", resetTextAndClearInterval);
pause.addEventListener("click", function(){
  clearInterval(timerID);
});
