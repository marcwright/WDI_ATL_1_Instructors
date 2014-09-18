// When "Start" Button is clicked, "Stop Watch" should become "Time elapsed: 0" & increment every second.
var start = document.getElementById("start");
var timer = document.getElementById("timer");
var reset = document.getElementById("reset");
var pause = document.getElementById("pause");

var seconds = 0; 

start.addEventListener("click", function(){
	timer.textcontent = "Time Elapsed: " + seconds;
	timerID = setInterval(function)(){
		seconds ++;
		timer.textcontent = "Time Elapsed: " + seconds;
	}, 1000);
});

reset.addEventListener("click")
// When "Reset" is clicked, the text should return to "Stop Watch"

// When "Pause" is clicked, the text should say "Time elapsed: 1", but stop incrementing.



