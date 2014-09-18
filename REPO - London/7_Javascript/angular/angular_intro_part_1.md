Angular
==================

[i]: Timings 2h 30min total, (1h 30mins up to App Landing Page)

What is Angular?
----------------

Angular is a front end javascript framework.

HTML is is desgined for statically built webpages. Rails creates html files but each one is served statically to the host.  Tools like javascript and jQuery allow you to update your page on the client side.

jQuery is a tool not a framework.  It is similar to using tools for DIY around the house.  For the odd bit here and there you can use your tool box to sort out minor jobs such as grouting, putting up shelves etc.  If you want an extension you need a plan and a structure. You need a foreman who is in charge of builders, electricians, plasterers etc.  Angular provides this framework to build complex web apps.

Angular extends the vocabulary of HTML.  At the same time it is designed to be expressive and readable. Unlike jQuery where you have to piece together HTML in the JS file and append them to the page, you can build your site as you wish and rely on Angular's two way data binding to populate your page.

Why do you want to use it?
---------------

If you want a dynamic website where individiual pieces of the page update without a full HTML page comming back from the server.

Examples are:
<http://www.gmail.com>
<http://www.diy.com>
<https://docs.angularjs.org/guide>


Why do we (at GA) use angular?
-----------------

One of the key advantages of angular is that the layout of the html and angular code looks very similair to erb. In addition it is currently the most popular framework for new projects.

How to get started with Angular:
--------------

Angular is a JavaScript framework - we need to include a JS file just like we did with jQuery and jQuery ui.


First let's create an app. In the command line we will create the directory structure.

```
  mkdir angular
  cd angular
  mkdir js
  mkdir css
```

Now create the files we need.

```
  touch index.html
  touch js/app.js
  touch css/style.css
  subl .
```

In index.html type `html` and press "tab" to generate template for the html.

If we go to the angular website we can get the link to angular js file.

<https://angularjs.org/>

If you click on download there is a link to the google servers.  You can download the file or get a link to it hosted on google sites:

<https://ajax.googleapis.com/ajax/libs/angularjs/1.2.21/angular.min.js>

 Link to it the file the head of our html. Also let's link to our app.js *after* the angular file.  Let's link to the stylesheet too.

```
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.21/angular.min.js"></script>
  <script type="text/javascript" src="js/app.js"></script>
  <link rel="stylesheet" href="css/style.css">
```

We will first have a play around with Angular on the page. To get angular to run we neet to add the following to the html tag at the top of our page. `ng-` is the tag that denotes some sort of angular functionality. Whereever you see that it is part of angular.  We will see this in more detail shortly. We will just play with angular on the page so don't need to give the app a name.

```
  <html ng-app="">
```

In erb we had tags such as `<%=  %>` the equivalent in angular is `{{ }}`

*Let's use some angular!*

[1:] In the body - try these one at a time:

```
  <p>{{ 4 + 7 }}</p>
  <p>{{ "hello" + " WDI" }}</p>
  <p>Hello has  {{"hello".length }} letters</p>
```

The code within the curly brackets gets run. Great - we can run some functionality right where we want it.  It's not hidden away in a JS file.  We can see from the HTML what it should look like. It should also feel familar to erb.

[i]: Delete the previous lines of Angular experiments

We can also call functions in the HTML:

```
  <button ng-click="basket = basket + 1">Add to basket</button>
  <div>Your basket has {{ basket }} items in it</div>
```

We can use the basket variable anywhere within our angular app. Angular automatically updates it wherever it sees it.  Imagine trying to do the same with jQuery. You would have to get the variable, add something to it, and then grab an element from a page and set that element's HTML.

Try using basket somewhere else on the page to show this:

```
  <div>Using basket somewhere else: {{basket}}</div>
```

Click on the button a few times to see basket in both places updating. Great - and we have hardly written any JavaScript - Angular does allot of the heavy lifting for us. The two way data binding is one of the most powerful aspects of Angular.

This is a basic example of using angular on the page.

An Angular App
--------------

In much the same way as we have MVC framework in Rails and other frameworks there is a similair philosophy around Angular.

The HTML is the view and the curly brackets are similair to ERB tags. Currently we have functions, which deal with other aspects of the app, written in the HTML.  We will move this functionality into a seperate file that deals with the modelling/contolling of the app - very similair to how we seperate out concerns in Rails.

In the app.js file.

 ```
  (function() {
    var app = angular.module('leatherLaneMarketApp', []);
  })();
 ```

When the JS runs this sets up an angular module with the name leatherLaneMarketApp.  The square brackets allow you to pass new functionality into the angular module. We wont worry about this now though!

We are going to write an app that lists and reviews the stalls on Leather Lane.

We have now included angular, and started the app module. The only thing we need to do next is attach it to our HTML.  For the apps we will look at we will just use one angular module on a page.  Therefore to ensure that this covers out entire document we will call the angular module called market on the HTML.  At the HTML tag put the name of the app inside the quotes so that we end up with:

```
  <html ng-app="leatherLaneMarketApp">
```

This runs the app - if we want to control any data on the page we set up an Angular controller.

In the app.js file within the Angular app add the following:

```
  app.controller('MarketController', function(){
      this.basket = 0;
    });
```

This will initialise the basket element within the market controller to be 0.

We need to attach this controller to the part of the page we want to control.  Wrap the button we had before with a div and link to the controller we just set up.

```
  <div ng-controller="MarketController as market">
```

To make the button variable reference the one initiliased in the app we need to refer to the controller.  We have "nicknamed" the controller as "market" so we update what we had before to `market.basket`.  Here is what the code should look like:

```
  <div ng-controller="MarketController as market">
    <button ng-click="market.basket = market.basket + 1">Click to add to basket</button>
    <div>Your basket has {{ market.basket }} items in it</div>
  </div>
```

Reload and check that the basket variable is initilaised with the value 0.  It still works when we click the button.  Next we want to move the function within ng-click into our JavaScript.

Inside the MarketController in the app.js:

```
  this.addToBasket = function() {
      this.basket ++
  }
```

And then change the HTML to call that function:

```
  <button ng-click="market.addToBasket()">Click to add to basket</button>
```

Make sure this is working in the browser.  Basket should be 0 on reload and increase as we click the button.

Congratulations!  We have a basic app up and working.


Leather Lane Angular App
=========================

Let's start fleshing out our Leather Lane market app. Let's give it a heading just inside the body tag and above the div referrencing the marketController.

```
  <h1>Angular Leather Lane Market App</h1>
```

Delete the add to basket functionality both in the app.js and in the HTML.  Keep the div referrencing the MartketController.

[i]: This is the stylesheet we will use for the app.  It can be used from the start -
however I would suggest adding it at the end of part 1. This link is included again later on. Copy and paste the styles into the already existing style.css file and make sure there is a link to it in the head. (same styles in example_app_style.css in same directory as these notes)
<https://gist.github.com/mikemjharris/0a2405d6b8a8fb5c53dc>

We want to list the various stalls and food options availiable on Leather Lane.  We are going to start the course by hard coding some JSON data within our app.js file. Later on we will get data from an api.

In the app.js file:

```
app.controller('MarketController', function(){
    this.stall = stall;
  });
```

add the following line at the bottom of the app.js:

```
stall = {
  name: "Burrito",
  price: 5,
  description:  "Meat and vegetables in a delicious wrap"
}
```

In the index.html.

```
    <div ng-controller="MarketController as market">
      <ul>
        <li>{{ market.stall.name}}</li>
      <ul>
    </div>
```

We can pull in the name of what the stall offers and show it on the page.  But there are lots of options on Leather Lane.  Instead of one stall let's have lots of stalls.  Here we want an array of stalls.  We need to change the controller and the html.

In app.js:

```
  app.controller('MarketController', function(){
    this.stalls = stalls;
  });
```

```
  stalls = [
  {
    name: "Burrito",
    price: 5,
    description:  "Meat and vegetables in a delicious wrap"
  },
  {
    name: "Pizza",
    price: 6.5,
    description:  "Cheese and meat and veg on some dough"
  },
  {
    name: "Fallafel",
    price: 4.5,
    description: "Deep fried delicious chickpeas"
  }
]
```

In index.html we want to cycle through the different stalls and list them.  In Ruby we used `.each`.  In Angular to iterate through an array we use the `ng-repeat` command.  We are also going to use this to navigate so we will add nav tags and add an `h2` element to label this section.

Let's see how that looks.

```
  <div ng-controller="MarketController as market">
    <nav>
      <h2>Stalls</h2>
      <ul>
        <li ng-repeat="stall in market.stalls">{{ stall.name}}</li>
      </ul>
    </nav>
  </div>
```

As we did in Ruby we define a placeholder name as we go through the array. There was no need to add or append anything to the page.  The controller deals with the data.  The HTML page works out how to display the data.  All very Rails like so far.


See a stall in more detail
-----------------------

When we click on a meal we want to see more details about it - description, price and later on we will add reviews. This is within the market controller on the page - just below the closing nav tag.

```
  <section>
    <h2>Selected Stall Details</h2>
    <table>
      <tr>
        <td>Name:</td>
        <td>{{ market.selectedStall.name }}</td>
      </tr>
      <tr>
        <td>Price:</td>
        <td> {{ market.selectedStall.price}}</td>
      </tr>
      <tr>
        <td>Description:</td>
        <td> {{ market.selectedStall.description}}</td>
      </tr>
    </table>
  </section>
```

But there's nothing there yet.  For now just set the selected meal to be one of the meals in our array.  We will make this dynamic later.

```
app.controller('MarketController', function(){
    this.stalls = stalls;
    this.selectedStall = stalls[0];
  });
```

Our selected stall is now showing on the page!  But we want it to change to whatever meal we click at in our list.
In jQuery we needed to bind a function to a specific element (e.g. on click, on submit. In Angular we can just define this in the HTML:

```
  <li ng-repeat="stall in market.stalls" ng-click="market.selectStall(stall)">
```

We now need to define the `selectStall(stall)` function in angular. Inside the market controller:

```
  this.selectStall = function(stall) {
    this.selectedStall = stall;
  }
```

This function passes in the meal object that was on the selected list item. It includes everything about the object including its description - even if this wasn't displayed on the page.

The amazing thing about this is we didn't have to amend or apend any HTML.  In jQuery we would have had to get all the data off the page, create some HTML and append it to the page. With Angular we just have to up date the variable

*Can we see how much easier this is than using jQuery?*

Things like search are super easy to implement with Angular.  Let's check it out.

Above the `<ul>` let's put an input box:

```
  <input ng-model="search" placeholder="search" />
```

Let's also amend the ng-repeat.  We want to pipe in the search term. The name "search" in ng-model is just a variable - it can be whatever you want.

```
  ng-repeat="stall in market.stalls | filter : {name: search}"
```

That section of HTML should read:

```
  <div ng-controller="MarketController as market">
  <nav>
    <h2>Stalls</h2>
    <input ng-model="search" placeholder="search" />
    <ul>
      <li ng-repeat="stall in market.stalls | filter : {name: search}" ng-click="market.selectStall(stall)">
      {{ stall.name}}
      </li>
    </ul>
  </nav>
```

This filters by the name. If you want to search for any attribute within any part of the object you can do:

```
  ng-repeat="stall in market.stalls | filter : search"
```

Our data is in a random order - we can easily tidy this up.  Use an `orderBy` filter within the ng-repeat command.

```
  <li ng-repeat="stall in market.stalls | filter : {name: search} | orderBy: 'name'" ng-click="market.selectStall(stall)">
```

We can also do things such as doing uppercase/lowercase/format currency on the output on screen - many of the things that you want to do with rails.

Let's make the app pretty - include the all the styles in this gist in your styles.css file.

<https://gist.github.com/mikemjharris/0a2405d6b8a8fb5c53dc>

[i]: same styles in the same directory as these notes - example_app_style.css


App Landing Page
=================

[i]: 1h to the end

When we first navigate to the page we probably don't want to have any meal selected.

Check this still works when you click on things.

We can use ng-show. Add this to the section tag.

```
    <section ng-show="market.selectedStall">
        <h2>Selected Stall Details</h2>
```

If selectedStall is not defined then this evaluates as false so the following section element isn't shown.

Check it out in the browser.

Let's show something else instead of the display selected meal.

What could be used instead of `ng-show`?

Can either use `!` symbol or `ng-hide`. Paste this section after the previous section closing tag.

```
  <section ng-hide="market.selectedStall">
    <h2>Leather Lane</h2>
    <p>Leather Lane is an awesome market in Clerkenwell that has a wide variety of lunch options.  Select an option from the left to see more details.</p>
  </section>
```

We can show and hide a section depending on whether data is used or not.  If we were using jQuery we would overwrite bits of HTML and have to listen for event handlers.

Speaking of that - how should we highlight the meal we have clikced on on the left?  In jQuery we would add an event handler and toggle a class on that element.   Let's see the Angular way.

Here we use some logic to set the class of the list item that is selected.

```
  ng-class="{highlighted: stall === market.selectedStall }"
```

It's very obvious from looking at the HTML what is happening.  With jQuery it was tough to know which elements would be changing.

We have a great looking app,  with cool features.  We have written very little in the Angular app.js file - we have leveraged most of the in built functions of Angular.


Close button
===========

We may want to clear the selected meal from the page?  Have a go and see if you can.

Solution:  In the first section add the following code:

```
  <div ng-click="market.clearSelectedStall()" class="close">
    x
  </div>
```

In the app.js we need to define `clearSelectedStall()`

```
  this.clearSelectedStall = function()  {
    this.selectedStall = false;
  }
```


Animation
=========

This all looks good.  How about we make it look even better.

Let's provide a link to `ng-animate` in our header - below angular but above our app.js.

```
  <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.6/angular-animate.js"></script>
```

We also need to add this functionality into our js file.

```
  var app = angular.module('leatherLaneMarketApp', ['ngAnimate']);
```

Now when we search for stalls we get a cool animation.  How does this work?  Angular adds classes to elements as they are added or removed from the page.  We can use these classes and style them.  If you check out the style.css file for the `ng-enter` and `ng-leave`.


Tabs
=======

What else do you have in a single page doc?  Different tabs.
Checkout these websites:

<http://www.habitat.co.uk/pws/ProductDetails.ice?ProductID=241397>
<http://www.futoncompany.co.uk/beds/single-stacking-bed.html>

With `ng-show` and `ng-hide` we can create different tabs on parts of the page.


$scope
--------

[i]: #TODO: need to add more info on *why* $scope is a benefit, and why to use it over `this.`.

We are going to bring in a slightly more advanced feature which will allow us to clean up the form.It will also help us tidy up the code.

It felt a bit clumsy in our code to alway have market.  infront of every variable.  We had defined this section of code as the MarketController so using market repeatedly doesn't feel very DRY.

In this case we are going to use $scope.  In our app.js for the controller line let's inlcude $scope. Like this:

```
    app.controller('MarketController', ["$scope", function($scope){
```

*Make sure you close the square bracket at the end of the marketController function.*

Now do a find and replace for "this."  in your controller.  Replace with "$scope."

Now if we refresh our browser nothing is working.  We need to remove "market." from infront of all our variables.  Find and replace `market.` with a blank character.

Check to see the app is working.  Yes the code is DRYer.  But we get extra access to elements on the page especially from within functions in our controller.


[i]:
Homework/Lab
============

[i]: On the first run of the class we did project review in the afternoon.  The spec for that can be found in the included lab_homework_part_1.md file.

