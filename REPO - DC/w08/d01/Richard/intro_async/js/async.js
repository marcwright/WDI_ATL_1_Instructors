/*
* @Author: Richard Hessler
* @Date:   2014-06-09 11:19:06
* @Last Modified by:   Richard Hessler
* @Last Modified time: 2014-06-09 11:57:25
*/

// Callback

setInterval(function() {
// function is actual callback
$('#callback-message').text('callback occurred at' + new Date().toTimeString())
}, 1000);


// Events
$('#event-bttn')[0].addEventListener('click', function(event) {
  var date = new Date(event.timeStamp);
  $('#event-message').text('Click event occurred at'+ date.toTimeString());
});

// Promise

var promise1 = $.Deferred();
var promise2 = $.Deferred();

promise1.then(function() {
  $('#promise-bttn1').after('done.');
});

$('#promise-bttn1').on('click', function() {
  promise1.resolve();
});

promise2.then(function() {
  $('#promise-bttn2').after('done.');
});

$('#promise-bttn2').on('click', function() {
  promise2.resolve();
});

// jQuery Library - Q
// for promises - think underscore for promises
Q.all([promise1, promise2]).then(function() {
  $('#promise-message').text('All Promise resolved at: ' + new Date().toTimeString());
});
