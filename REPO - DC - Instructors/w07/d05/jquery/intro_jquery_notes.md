#jQuery Notes

###Think - Pair - Share / jQuery
- Give the students the `jquery_research.md` file for reading - 15 minutes
- Students discuss the answer to the questions - 5 minutes
- Students volunteers their findings (5 minutes)
    - What is jQuery?
    - What problem does it solve?
    - What are the alternatives?

###Code Along
1. Merge branch `sandbox`
1. `git push origin master`
1. Have students pull from upstream master.
1. Have students `cd` into the `jquery_sandbox` directory
1. Have students open `index.html` in Chrome and open up the developers console.

__To use the rich buffet of methods available to jQuery objects, we first have to *create* jQuery objects.__

```javascript
// we target elements using CSS selectors
// the long way via 'jQuery'
jQuery("#title");

// the short way 
$("#title");

// the vanilla js alternative
document.getElementById("title");

// let's save this title to a variable for effiency
var title = $("#title");


// what can we do with this object?
title.addClass("pleasant");
title.attr("role", "page-identification");

// what if we want to grab multiple elements of a given type?
$("li");

// What if we want the second li on the page. Can we use jQuery methods on them?
$("li")[1].children()

// NOPE! We have to wrap non-jquery objects in jQuery wrappers if we want to use jQuery methods
$($("li")[0]).css("color", "red")
```
__Okay, so we can grab objects from the DOM, but what if we want to create *new* jQuery objects and append them to the DOM.__

```javascript
// to tell jQuery that we want a *new* element, we have to provide the opening tag of the element, complete with carrots
var newLI = $("<li>");
newLI.text("Bully Repulsion");
$("#feature-list").append(newLI);
```

__STRESS THAT YOU CAN USE VANILLA JAVASCRIPT ALONGSIDE JQUERY. The two aren't mutually exclusive.__

1. Show the `methods_for_students_to_research.md` file, which is open in your browswer.
1. Give them 15 minutes to play around in the sandbox
1. Afterwards, explain why it's better to use `.addClass()` over `.css()`

#### 10 - Minute Break

Demo the document ready function
```javascript
$(document).ready(function(){
  // ensures javascript doesn't execute prematurely
});
```
___
#### Fart Store
1. `git checkout sandbox`
1. `git merge fartstore`
1. `git checkout master`
1. `git merge sandbox`
1. `assign`
1. `git push origin master`

Review Fart Store
```javascript
// change the h1 text to "The Fart Store"
var title = $("#title");
title.text("The Fart Store");
// add "classy" class to the h1.
title.addClass("classy");
// change the h1's font size to 4ems.
title.css("font-size", "4em");

// change first paragraph content to Axel Rose lyric
var firstParagraphTag = $("p").eq(0);
firstParagraphTag.html("We've got fun AND games - Axel Rose");


// change header from 'Sandbox Features' to 'Manifesto:'
var h2 = $("h2");
h2.text("Manifesto:");

// remove entire ul from DOM
$("#feature-list").remove();

// beneath the 'Manifesto' h2, add a paragraph that reads "No judgement."
var newParagraphTag = $("<p>");
newParagraphTag.text("No judgement.");
h2.after(newParagraphTag);

// Create a button element with text "Sample The Product" and an id of "sample-button". Append it to the DOM's <body> element
var sampleButton = $("<button>");
sampleButton.text("Sample The Product");
sampleButton.attr("id", "sample-button");
$("body").append(sampleButton);

///////////////
// BONUS
///////////////

sampleButton.on("click", emitFart);

function emitFart(){
  var newDiv = $("<div>");
  newDiv.addClass("product");
  newDiv.css("display", "none")
  $("body").append(newDiv);
  setTimeout(function(){
    newDiv.fadeIn();
  }, 1500);
  setTimeout(function(){
    newDiv.fadeOut('slow');
  }, 5000);
}

```

#### 5 - Minute Break

####LOTR jQuery with Partners
```javascript
// lets start by adding the localities to the page.
function makeMiddleEarth() {
  // create a section tag with an id of middle-earth
  var middleEarth = $("<section>").attr("id", "middle-earth");
  // add each locality as an article tag
  for(var i = 0; i < localities.length; i++){
    var landTitle = $("<h1>").text(localities[i]);
    // inside each article tag include an h1 with the name of the land
    var land = $("<article>").append(landTitle);
    middleEarth.append(land);
  }
  // append middle-earth to your document body
  documentBody.prepend(middleEarth);
}
```

__Great, now lets invoke this with a timer__
```javascript
// invokes first function 5 seconds after page load
setTimeout(makeMiddleEarth, 5000);
```

__Cool, now lets add a timer to invoke the next function, makeMiddleEarth__
```javascript
  // set a timer to fire off the next function in the chain, ie: makeHobbits
  setTimeout(makeHobbits, 2000);
```

__Great, now let's build out makeHobbits__

```javascript
function makeHobbits() {
  console.log("making hobbits");
  var theShire = $("article").first();
  // display an unordered list of hobbits within the shire (the article tag, not the h1)
  var hobbitList = $("<ul>");
  for(var i = 0; i < hobbits.length; i++){
    // give each hobbit a class of hobbit
    var hobbitLI = $("<li>").text(hobbits[i]).addClass("hobbit");
    hobbitList.append(hobbitLI);
  }
  theShire.append(hobbitList);
}
```

__Awesome. Let's set a time to fire off the next function, keepItSecretKeepItSafe__

```javascript
  // set a timer to fire off the next function, keepItSecretKeepItSafe
  setTimeout(keepItSecretKeepItSafe, 1000)
```

__This is the best. Now we can add a sweet, tangible ring to frodo and give it a nazgul listener__

```javascript
function keepItSecretKeepItSafe() {
  // create a div with an id of 'the-ring'
  var theOneRing = $("<div>").attr("id", "the-ring");
  // use jQuery to give the div a height and width of 15px and a background-color of gold
  theOneRing.css("height", "15px").css("width", "15px").css("background-color", "gold");
  // add an eventlistener to the ring so that when someone clicks on it, it invokes the 'nazgulScreech' function
  theOneRing.on("click", function(){
    nazgulScreech();
  })
  // add the ring as a child of Frodo
  $("li").first().append(theOneRing);
}
```

__Now we need to set up a timer to invoke the next function__

```javascript
// set a timer to fire off the next function, makeBuddies
setTimeout(makeBuddies, 1500);
```
__Here's makeBuddies__
```javascript
function makeBuddies() {
  // create an aside tag
  var aside = $("<aside>");
  var buddiesUL = $("<ul>");
  // append an unordered list of buddies to the aside
  for(var i = 0; i < buddies.length; i++){
    var bud = $("<li>").text(buddies[i]);
    buddiesUL.append(bud);
  }
  aside.append(buddiesUL);
  // insert your aside BEFORE rivendell
  $($("article")[1]).before(aside);
}
```

__Nice, but we have to set a timer to invoke the next function__

```javascript
  // set a timer to invoke the beautifulStranger function
  setTimeout(beautifulStranger, 1500);
```

__Let's set up the beautifulStranger function__

```javascript
function beautifulStranger() {
  console.log("beautiful stranger firing");
  // change the buddy 'Strider' textnode to 'Aragorn'
  var strider = $("ul").last().children()[3];
  $(strider).text("Aragorn");
  // set a timer to invoke the forgeTheFellowShip function
  setTimeout(forgeTheFellowShip, 1500);
}
```

__Now let's add forgeTheFellowShip__

```javascript
function forgeTheFellowShip() {
  // move the hobbits and the buddies to Rivendell
  var hobbitsAndBuddies = $("li");
  var rivendell = $("article")[1];
  $(rivendell).append(hobbitsAndBuddies);
  // create a new div called 'the-fellowship'
  var newDiv = $("<div>").attr("id", "the-fellowship");
  newDiv.html("<h1>The Fellowship</h1>");
  newDiv.css("border", "1px solid black");
  $(rivendell).append(newDiv);
  // add each hobbit and buddy one at a time to 'the-fellowship'
  for(var i = 0; i < hobbitsAndBuddies.length; i++){
    newDiv.append(hobbitsAndBuddies[i]);
    var hobbitName = $(hobbitsAndBuddies[i+1]).text();
    // after each character is added make an alert that they have joined your party
    alert(hobbitName + "has joined the fellowship");
  }
}
```













