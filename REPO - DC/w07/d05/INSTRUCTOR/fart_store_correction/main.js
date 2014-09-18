// change the h1 text to "The Fart Store"
var $title = $("#title");

$title.text("The Fart Store");
// add "classy" class to the h1.
$title.addClass("classy");
// change the h1's font size to 4ems.
$title.css("font-size", "4em");

// change first paragraph content to Axel Rose lyric
var $firstP = $("p").eq(0);
$firstP.html("We've got fun <span>AND</span> games. - Axl Rose");

// change header from 'Sandbox Features' to 'Manifesto:'
var $h2 = $("h2").text("Manifesto");

// remove entire ul from DOM
$("ul").remove();

// beneath the 'Manifesto' h2, add a paragraph that reads "No judgement."
var $newP = $("<p>");
$newP.text("No judgement");

$h2.after($newP);

///////////////
// BONUS
///////////////

// Create a button element with text "Sample The Product" and an id of "sample-button". Append it to the DOM's <body> element
var $newButton = $("<button>");
$newButton.text("Sample The Product");
$newButton.attr({ id: "sample-button", role: "funzies" });

var $body = $("body")
$body.append($newButton);

$newButton.on("click", emitFart);

function emitFart(){
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


