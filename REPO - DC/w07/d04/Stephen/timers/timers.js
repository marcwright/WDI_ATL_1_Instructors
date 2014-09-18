/*
* @Author: stephenstanwood
* @Date:   2014-06-05 09:04:11
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-06-05 09:39:38
*/

// run the setup functions on page load
setUpStartButton();
setUpResetButton();
setUpPauseButton();

var timeElapsed = 0;

// When "Start" Button is clicked, "Stop Watch" should become "Time elapsed: 0" & increment every second.
function setUpStartButton() {
  var s = document.getElementById( 'start' );
  s.addEventListener( 'click', startTimer );
}

function setUpResetButton() {
  var r = document.getElementById( 'reset' );
  r.addEventListener( 'click', resetTimer );
}

function setUpPauseButton() {
  var p = document.getElementById( 'pause' );
  p.addEventListener( 'click', pauseTimer );
}

// helper functions
function startTimer() {
  timer = window.setInterval( tick, 10 );
  var t = document.getElementById( 'timer' );
  t.textContent = 'Time Elapsed: 0';
}

function resetTimer() {
  window.clearInterval( timer );
  timeElapsed = 0;
  var t = document.getElementById( 'timer' );
  t.textContent = 'Stop Watch';
}

function pauseTimer() {
  window.clearInterval( timer );
}

function tick() {
  timeElapsed++;
  var t = document.getElementById( 'timer' );
  t.textContent = 'Time Elapsed: ' + ( timeElapsed / 100 ).toFixed( 2 );
}

// When "Reset" is clicked, the text should return to "Stop Watch"


// When "Pause" is clicked, the text should say "Time elapsed: 1", but stop incrementing.



