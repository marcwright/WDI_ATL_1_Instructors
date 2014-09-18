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

//1. 
$("h1").text("The Fart Store");

//2.
$("h1").addClass("classy");
//more specific
//$(#title).addClass("classy");

//3. Change the h1's font size to 4ems
$("h1").css({ "font-size": "4em" });


//4.  Target that first paragraph tag and change it's HTML content to "We've got fun AND games - Axel Rose"
$("p").first().text("We've got fun AND games - Axel Rose")
//.eq() is better than .first

//5. Change the h2's text from "Sandbox Features:" to "Manifesto"
$("h2").text("Manifesto")
var $h2 = $("h2").text("Manifesto");

//6. Remove the entire unordered list of features from the DOM
$("ul").remove();

//7. Beneath the 'Manifesto' h2, append a paragraph that reads "No judgement." (Look into the .after() method)
$("h2").after('<p>No Judgement</p>');

//8. Create a button element with text "Sample The Product" and an id of "sample-button". Append it to the DOM's <body> element

var $newButton = $("<button>");
$newButton.text("Sample the Product");
$newButton.attr({ id: "sample-button", role: "funzies" });

var $body = $("body");
$("body").append($newButton);

function emitFart() {
  var $newDiv = $("<div>");
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

