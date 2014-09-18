Directives
==========

[i]: Directives can be included within the lesson plan anytime from midway through day 1.

[i]: Here we will look at the app from the end of day two.


Partials in Angular: Using `ng-include`
----------------------------

Our javascript file is still pretty small and mangeable.  There are small distinct functions for managing various parts of the site.

Angular is supposed to make our html more expressive. While this is the case in many cases our html starts to feel quite long and cluttered.  There are also parts of it that we may want to use elsewhere on our site.

In rails we used partials to split out sections into reusuable parts.  Angular has something similar called `ng-include`.

We can split different sections of the page up into seperate modules/html files and include them in our main `index.html` file. This will make the main page easier to manage.For large sites and companies it means different people and teams can easily mark on each section of the site independently.

Here we will split out the form that we use to add items to the page into a seperate file.

This is the code we will be cutting from `index.html`:

[i]: use a different seciton of code if this lesson is being run at a different time.

```
  <h3>Add an item</h3>
  <form name="stallForm" ng-submit="stallForm.$valid && addStall(newStall)" novalidate>
    <div class="warning-number">  Price must be beween 1 and 10
    </div>
    <label>Name</label>
    <input type="text" ng-model="newStall.name" required/><br>
    <label>Price</label>
    <input type="number" ng-model="newStall.price" min="1" max="10" required/><br>
    <label>Description</label>
    <textarea ng-model="newStall.description"></textarea><br>
    <button>Submit</button>
  </form>
```

In the same directory create a file called `new-stall-form.html` and paste in the code from the `index.html`.

In your `index.html` where the above code was put the following code:

##### important - there are single quotes inside double quotes.

```
  <div ng-include="'new-stall-form.html'"></div>
```

When we refresh in the console we get an error in our javascript console.

For this to work we need to be running the code on a server.

In the terminal run a python simple server from the directory where you app is.

```
  python -m SimpleHTTPServer
```

Open up <http://0.0.0.0:8000> in chrome to see the site.

Great - we can split out as much of the page we want into standalone segments.  For a large site with many different pages the same sections of code can be used in multiple places.


Directives
----------

Next we will look at directives.  For now this will do pretty much the same as we did with ng-include.  It has two advantages:

- firstly it makes our html even more expressive.
- secondly it has much more advanced functionality.

We will just start with the basics.

In our app.js file we are going to write our own directive.  Below the controller write the following. Don't worry about what it means for now - let's just see how it works.

```
  app.directive('newStallForm', function() {
    return {
      restrict: 'E',
      templateUrl: 'new-stall-form.html'
    }
  })
```
In our index.html we want to use this diretive.  For now leave in the div using ng-include. Below let's use our directive:

```
  <new-stall-form></new-stall-form>
```

Isn't that nice and expressive!  Reload the page and check that you get two forms.  Remove the div with the ng-include.

Directives are very flexible and can be called in many ways.  The tag can be self closing e.g.

```
  <new-stall-form />
```

This will have the same functionailty. However some browers don't like this so best to stick with a closing tag.

When naming single word directives watch out you future proof it. e.g. if you create a carousel directive in a future version of html this may be an actual html element.  Best practice is to prefeame it with three letters. Avoid using ng- to avoid conflict with angular.

*What does restrict mean?*

Restict is how your directive is called on the page. There are three options which can be combined.

* A - directive matches attribute name:

```
  <div new-stall-form></div>
```

* E - matches element name:

```
  <new-stall-form></new-stall-form>
```

* C - matches class name:

```
  <div class="new-stall-form"></div>
```

Why should you use different ones? This is according to the Angular docs:

When should I use an attribute versus an element? Use an element when you are creating a component that is in control of the template. The common case for this is when you are creating a Domain-Specific Language for parts of your template. Use an attribute when you are decorating an existing element with new functionality.

As an example in our app we could move the `<li>` that has the ng-repeat to a new file called 'stall-list'  Then in the html we could have:

```
  <ul class="stall-list">
  </ul>
```

The page would look the same as before - however we haven't added in a *new* element - we will have a ul.  In addition it can make the styling inside easier as it is all within the class "stall-list". This may save having to set up more classes for the elements within the stall-list directive.


*More info:  *
<https://docs.angularjs.org/guide/directive>
<http://www.thinkster.io/angularjs/rep5re7gTM/angularjs-directive-restrictions>




Including Bootstrap in your app
=============================

Directives allow you to create code in your own little module and include it elsewhere in your projects.

This also allows third parties to include extra functionality for your app.

Examples of this are Angular UI which packages up most of the jQuery UI for Angular.

<http://angular-ui.github.io/bootstrap/>

Click on the download button. Save the file in our app.js.

The docs say that all we need from the Bootstrap site is the CSS file.

```
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
```

Let's link to that in the header of our app.

```
  <script src="js/ui-bootstrap-tpls-0.11.0.js"></script>
```

We also need to tell our app that it depends on the ui.bootstrap:

```
  angular.module('leatherLaneMarketApp', ['ui.bootstrap']);
```

First let's try out datepicker. Just inside the controller put the following.

```
  <datepicker ng-model="datePicker"></datepicker>
```

We can then style this to fit on our page. This is designed to just show how we can include directives.

Let's try out the accordion - we will use it as an alternative option for our left hand menu.

Just below the input box and above the ul:

```
  <accordion>
    <accordion-group ng-repeat="stall in stalls" heading="{{stall.name}}">{{ stall.description }}</accordion-group>
  </accordion>
```


Try yourselves
================

There are plenty of others out there. For example google maps:

<https://github.com/allenhwkim/angularjs-google-maps>

Follow the instructions on github.

We need to include these two files in the head of our file:

```
  <script src="http://maps.google.com/maps/api/js?sensor=false"></script>
  <script src="http://rawgit.com/allenhwkim/angularjs-google-maps/master/build/scripts/ng-map.min.js"></script>
```

Include `ngMap` as a dependency:

```
  angular.module('myApp', ['ngMap']);
```

Then in our intro section include the following code:

```
  <map style="display:block; height:300px" zoom="15" center="clerkenwell" >
  </map>
```
We have a map focusing on Clerkenwell!  Note we didn't have to give it longitude or latitude.  We could input a postcode.

Let's show how we could add a marker:

```
  <marker position="EC1R 5EN"></marker>
```

Place the code inside the map directive.

Great we have a marker.  What happens if we got given an array of markers from our database?

Let's use `ng-repeat` and list our markers.

```
  <marker ng-repeat="marker in mapMarkers" position="{{marker}}"></marker>
```

Replace the code inside our map to the above.  We now need to set mapMarkers in our javascript. Just inside the controller:

```
  $scope.mapMarkers = ["E5 0NH", "N1 1DU", "E1 6ST"]
```

We will need to set the zoom on the map to be 11 to see all the markers.





