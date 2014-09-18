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

var $title = $("#title");
$title.text("The Fart Store");
$title.addClass("classy");
$title.css("font-size", "4em");
$("p").html("We've got fun AND games - Axel Rose");
var $h2 = $("h2").text("Manifesto");
$("ul").remove();
var $newP = $("<p>");
$newP.text("No judgement.");
$h2.after($newP);
$newButton = $("<button>");
$newButton.text("Sample The Product");
$newButton.attr("id", "sample-button");
var $body = $("body");
$body.append($newButton);

$newButton.on( "click", sampleFart);

function sampleFart(){
  var $newDiv = $("<div>");
  $newDiv.addClass("product");
  $newDiv.css("display", "none");
  $body.append($newDiv);
  setTimeout(function(){
    $newDiv.fadeIn();
  }, 1500);
  setTimeout(function(){
    $newDiv.fadeOut('slow');
  }, 5000);
}
