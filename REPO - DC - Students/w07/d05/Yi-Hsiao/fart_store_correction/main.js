$(function() {
  
  $("#title")
    .text("The Fart Store")    // change title to 'The Fart Store'
    .addClass("classy")        // style title
    .css("font-size", "4em");  // change font-size to 4ems

  // change first paragraph's text
  $("p:eq(0)")
    .html("We've got fun <strong>AND</strong> games - Axel Rose");

  $("h2:eq(0)")
    .text("Manifesto")               // change 2nd heading's text
    .after("<p>No judgement.</p>");  // add a paragraph 'No judgement' underneath the heading

  $("ul:eq(0)")
    .remove();

  $("body")
    .append("<button id='sample-button'>Sample the Product</button>");

  // get fart sound
  var audioElement = document.createElement('audio');
  audioElement.setAttribute('src', 'http://www.soundjay.com/human/sounds/fart-01.mp3');
  $.get();

  $('#sample-button').on("click", function() {
    audioElement.play();
  });
});