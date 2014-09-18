$(function(){
var body = $('body');
var title = $('title')
title.text('The Fart Store');
title.addClass('classy');
title.css('font-size', '4em');

var paragraphOne = $('p').html("We've got fun <strong>AND</strong> games - Axl Rose");

var headerTwo = $('h2').text('Manifesto:');

$('ul').remove();

headerTwo.after('<p>No judgement.</p>');

$('body').append($('<button>Sample The Product</button>').attr({id : 'sample-button'}));

function emitFart(){
  var newDiv = $('<div>');
  newDiv.addClass('product');
  newDiv.css('display', 'none');
  body.append(newDiv);
  setTimeout(function(){
    newDiv.fadeIn();
  }, 1500);
  setTimeout(function(){
    newDiv.fadeOut('slow');
  }, 5000);
};

$('button').on('click', emitFart());



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
});
