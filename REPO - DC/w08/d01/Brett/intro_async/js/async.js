// Callback

setInterval(function() {
  $("#callback-message").text("Callback occurred at " + new Date().toTimeString());
}, 1000);

// Event
$("#event-bttn")[0].addEventListener("click", function(event) {
  var date = new Date(event.timeStamp);
  $("#event-message").text("Click event occurred at: " + date.toTimeString());
});

// Promise

// TODO: Research deferred
var promise1 = $.Deferred();
var promise2 = $.Deferred();

promise1.then(function() {
  $("#promise-bttn1").after("done.");
});

promise2.then(function() {
  $("#promise-bttn2").after("done.");
});

$("#promise-bttn1").on("click", function() {
  promise1.resolve();
});

$("#promise-bttn2").on("click", function() {
  promise2.resolve();
});

Q.all([promise1, promise2]).then(function() {
  $("#promise-message").text("All promises resolved at: " + new Date().toTimeString());
});

