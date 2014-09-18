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

// Change the H1 text to 'The Adam Store'
$('#title').text('The Adam Store');

// Add the "classy" class to the h1.
$('#title').addClass('classy');

// Change the h1's font size to 4ems.
$('#title').css('font-size', '4em');

// Target that first paragraph tag and change it's HTML content to "We've got fun <strong>AND</strong> games - Axel Rose"
$('p').html("We've got fun <strong>AND</strong> games - Axel Rose");

// Change the h2's text from "Sandbox Features:" to "Manifesto"
$('h2').text('Manifesto');

// Remove the entire unordered list of features from the DOM
$('#feature-list').remove();

// Beneath the 'Manifesto' h2, append a paragraph that reads "No judgement." (Look into the `.after()` method)
$('h2').after("<p>No judgement.</p>");

// Create a button element with text "Sample The Product" and an id of "sample-button". Append it to the DOM's `<body>` element
$('body').append("<button id='sample-button'>Sample The Product</button>");

// BONUES: Add an event listener to your new button using jQuery's `.on()` method. When the button is clicked, a div of the "product" class should fade into view at the bottom of the dom. After 5 seconds, this div should disappear.

function emitFart() {
  var $newDiv = $ ("<div>");
  $newDiv.addClass("product");
  $newDiv.css("display", "none");
  $body.append($newDiv);
  setTimeout(function() {
    $newDiv.fadeIn();
  }, 1500);
  setTimeout(function() {
    $newDiv.fadeOut('slow');
  }, 5000);
}
