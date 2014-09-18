// Callback

setInterval(function() {
	$("#callback-message").text('Callback occured at' + new Date().toTimeString());

}, 1000);


// EVENT

$('#event-bttn')[0].addEventListener('click', function(evt) {
   var date = new Date(evt.timestamp);
   $('#event-message').text('Click event occured at: ' + date.toTimeString());
  });


// PROMISE

var promise1 = $.Deffered(); 
var promise2 = $.Deffered();

promise1.then(function() {
	$('#promise-bttn1').after('done.');
});

promise2.then(function() {
	$('#promise-bttn2').after('done.');
});

$('#promise-bttn1').on('click', function() {
	promise1.resolve();
});

$('#promise-bttn2').on('click', function() {
	promise2.resolve();
});

Q.all([promise1, promise2]).then(function() {
	$('#promise-message').text('All promises resolved at: '+ new Date().toTimeString()
});
