/*
* @Author: stephenstanwood
* @Date:   2014-06-06 14:39:58
* @Last Modified by:   stephenstanwood
* @Last Modified time: 2014-06-06 15:11:11
*/

console.log("================================");
console.log("Welcome to Your Sandbox Console.");
console.log("================================");

console.log("Click on http://jquery.com to head to the docs");

// Q: How do you make a DOM element a jQuery object?
// A: Target it with a css selector and then just wrap it in cash, homie.
      // Example:  $("#title")

// Q: How do you create a NEW jQuery object you can later append to the DOM?
// A: Provide the opening tag of the type of element you want to create and then wrap it in cash
      // Example: var newDiv = $("<div>");

// 1. Change the h1 text to "The Fart Store"
$( '#title' ).text( 'The Fart Store' );

// 2. Add the "classy" class to the h1.
$( '#title' ).addClass( 'classy' );

// 3. Change the h1's font size to 4ems.
$( 'h1' ).css( 'font-size', '4em' );

// 4. Target that first paragraph tag and change it's HTML content to "We've got fun <strong>AND</strong> games - Axel Rose"
$( 'p' ).eq( 0 ).html( 'We\'ve got fun <strong>AND</strong> games - Axel Rose' );

// 5. Change the h2's text from "Sandbox Features:" to "Manifesto"
$( 'h2' ).eq( 0 ).text( 'Manifesto' );

// 6. Remove the entire unordered list of features from the DOM
$( 'ul' ).eq( 0 ).remove();

// 7. Beneath the 'Manifesto' h2, append a paragraph that reads "No judgement." (Look into the `.after()` method)
$( 'h2' ).eq( 0 ).after ( '<p>No judgement</p>' );

// 8. Create a button element with text "Sample The Product" and an id of "sample-button". Append it to the DOM's `<body>` element
var b = $( '<button id=\'sample-button\'>Sample The Product</button>' );
$( 'body' ).append( b );

// ####Bonus
// Add an event listener to your new button using jQuery's `.on()` method. When the button is clicked, a div of the "product" class should fade into view at the bottom of the dom. After 5 seconds, this div should disappear.
$( '#sample-button' ).on( 'click', function() {
  var d = $( '<div class=\'product\'></div>' );
  $( 'body' ).append( d );
  $( '.product' ).fadeIn();
  setTimeout( function() { $( '.product' ).fadeOut()  }, 5000);
});

// __NOTE:__ For this one, there are several options you can use for setting the event listener, but it's best to go with jQuery's `.on()` method, for reasons I'll soon explain.

