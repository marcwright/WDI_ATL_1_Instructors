// callback
setInterval(function() {
  $('#callback-message').text('Calling back at' + new Date().toTimeString());
}, 1000);

// event
$('#event-bttn')[0].addEventListener('click', function(evt) {
  var date = new Date(evt.timeStamp);
  $('#event-message').text('Click happened at:' + date.toTimeString());
});

// promise
var promise1 = $.Deferred();
var promise2 = $.Deferred();


promise1.then(function() {
  $('#promise-bttn1').after('Done');
});

promise2.then(function() {
  $('#promise-bttn2').after('Fin');
});

$('#promise-bttn1').on('click', function() {
  promise1.resolve();
});

$('#promise-bttn2').on('click', function() {
  promise2.resolve();
});

Q.all([promise1, promise2]).then(function() {
  $('#promise-message').text('All promises resolved at:' + new Date().toTimeString())
});
