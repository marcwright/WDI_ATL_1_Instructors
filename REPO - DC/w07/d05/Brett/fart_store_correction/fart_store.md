## The Fart Store

The jQuery Sandbox is cool, but market demands have changed and we need a fart store, so we're going to be doing some remodeling with jQuery in our `main.js` file.

####Directions
1. Change the h1 text to "The Fart Store"
1. Add the "classy" class to the h1.
1. Change the h1's font size to 4ems.
1. Target that first paragraph tag and change it's HTML content to "We've got fun <strong>AND</strong> games - Axel Rose"
1. Change the h2's text from "Sandbox Features:" to "Manifesto"
1. Remove the entire unordered list of features from the DOM
1. Beneath the 'Manifesto' h2, append a paragraph that reads "No judgement." (Look into the `.after()` method)
1. Create a button element with text "Sample The Product" and an id of "sample-button". Append it to the DOM's `<body>` element

####Bonus
Add an event listener to your new button using jQuery's `.on()` method. When the button is clicked, a div of the "product" class should fade into view at the bottom of the dom. After 5 seconds, this div should disappear.

__NOTE:__ For this one, there are several options you can use for setting the event listener, but it's best to go with jQuery's `.on()` method, for reasons I'll soon explain.


