console.log("================================");
console.log("Welcome to Your Sandbox Console.");
console.log("================================");

$("h1").text("The Fart Store")
$("h1").addClass("classy")
$('h1').css('font-size', '4em')
$('p').eq(0).html("We've Got fun <b>AND</b> games - Axel Rose")
$('h2').eq(0).text("Manifesto")
$('ul').remove();
$('<p>No Judgement</p>').insertAfter('h2')
$('body').append($('<button>Sample The Product</button>').attr('id','sample-button'))
// $('#sample-button').on('click', function() {
// // $('body').append($('<div>').addClass('product'));
// // })


function emitFart() {
  var $newDiv = $('<div>');
  $newDiv.addClass("product");
  $newDiv.css("display", "none");  //creates div, but invisible
  $('body').append($newDiv);
  setTimeout(function(){
    $newDiv.fadeIn();
  }, 1500);

  setTimeout(function() {
    $newDiv.fadeOut('slow');
  }, 5000)

}
emitFart();
console.log("Click on http://jquery.com to head to the docs");

// Q: How do you make a DOM element a jQuery object?
// A: Target it with a css selector and then just wrap it in cash, homie.
      // Example:  $("#title")

// Q: How do you create a NEW jQuery object you can later append to the DOM?
// A: Provide the opening tag of the type of element you want to create and then wrap it in cash
      // Example: var newDiv = $("<div>");
