// callback
setInterval(function() {
  $( "#callback-message" ).text( "Callback occurred at " + new Date().toTimeString() );
}, 1000);

// events
document.getElementById( "event-bttn" ).addEventListener( "click", function( evt ) {
  var clickedAt = new Date( evt.timeStamp );
  document.getElementById( "event-message" ).textContent = "Click occurred at " + clickedAt;
});

// promise
var promise1  = $.Deferred();
var $promiseButton1 = $( "#promise-bttn1" );

var promise2  = $.Deferred();
var $promiseButton2 = $( "#promise-bttn2" );

promise1.then(function( evt ) {
  var resolvedAt = new Date( evt.timeStamp );
  $promiseButton1.after( "Promise one was resolved at " + resolvedAt );
});

promise2.then(function( evt ) {
  var resolvedAt = new Date( evt.timeStamp );
  $promiseButton2.after( "Promise two was resolved at " + resolvedAt );
});

$promiseButton1.on( "click", function( evt ) {
  promise1.resolve( evt );
});

$promiseButton2.on( "click", function( evt ) {
  promise2.resolve( evt );
});

Q.all([promise1, promise2]).then(function() {
  $( "#promise-message" ).text( "All promises resolved at " + new Date().toTimeString() );
});