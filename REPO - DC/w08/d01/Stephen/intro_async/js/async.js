/*
* @Author: stephenstanwood
* @Date:   2014-06-09 11:41:09
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-06-09 11:56:54
*/

// callback function
setInterval( function() {
  $( '#callback-message' ).text( 'callback occurred at ' + new Date().toTimeString() );
}, 1000);

// event listener
$( '#event-bttn' )[0].addEventListener( 'click', function( e ) {
  var date = new Date( e.timeStamp );
  $( '#event-message' ).text( 'Click event occurred at ' + date.toTimeString());
});

// promise
var promise1 = $.Deferred();
promise1.then( function() {
  $( '#promise-bttn1' ).after( 'done.' );
});

$( '#promise-bttn1' ).on( 'click', function() {
  promise1.resolve();
});

var promise2 = $.Deferred();
promise2.then( function() {
  $( '#promise-bttn2' ).after( 'done.' );
});

$( '#promise-bttn2' ).on( 'click', function() {
  promise2.resolve();
});

Q.all( [promise1, promise2] ).then( function() {
  $( '#promise-message' ).text( 'All promises resolved at: ' + new Date().toTimeString() );
});
