
Angular Lunch App Continued: Day two
=============

Adding data with a form
-----------------------

We have our app.  There is no functionality to add a stall - we have to go in and edit our hardcoded examples.  To add data we will want to have a form.  Due to Angular's two way data binding adding the data from the form to the page is much simpler than using jQuery. We jsut need to add data to our stall array and angular will look after the rendering on the page.

Just inside the closing nav tag and below the closing ul put the following code:

```
  <h3>Add an item</h3>
  <form>
    <label>Name</label>
    <input type="text" /><br>
    <label>Price</label>
    <input type="number" /><br>
    <label>Description</label>
    <textarea></textarea><br>
    <button>Submit</button>
  </form>
```

We have a form on the page but so far it does nothing. However, note that even if I have text in the input boxes I can still click on other parts of the page and the text in the input boxes doesn't disappear. This is why email etc. are single page web apps and why using a tool like Angular is important. We can still navigate around without refreshing.


Modeling varibles : ng-model
----------------------------

In Angular we can model something by using ng-model. We briefly saw this before with the search filter. We shall go into more detail here.  When we input data in the form we are creating a new stall.  We want to model each of the keys in a stall: Name, price and description.

```
  <h3>Add an item</h3>
  <form>
    <label>Name</label>
    <input type="text" ng-model="newStall.name"/><br>
    <label>Price</label>
    <input type="number" ng-model="newStall.price" /><br>
    <label>Description</label>
    <textarea ng-model="newStall.description"></textarea><br>
    <button>Submit</button>
  </form>
```

With Angular we get two way data binding. Let's show how this works. In the list of items let's copy the li element but change the name inside to newStall. Get rid of `ng-repeat` and instead use `ng-show`. We've also added a class of .new_item (this is for formating)

```
  <li class="new_item" ng-show="newStall" ng-click="selectStall(newStall)" ng-class="{highlighted: newStall === selectedStall }">
        {{ newStall.name}}
  </li>
```

Now as we enter values into our text box they are displayed at end of the list. This highlights angular's two way data binding.  It is constantly looking out for changes in any variable and will render them straight away in the view.

This shows what is in the input box at the end of the list but doesn't add it to our list.  If we want to add another stall we can't!

We want to be able to add this to the list of elements in our stalls array in out app.

On our form let's run a function when it is submitted.  We can use Angular's `ng-submit`:

```
  <form ng-submit="addStall()">
```

In our app.js we need to define the addStall function

```
  $scope.addStall = function() {
      $scope.stalls.push($scope.newStall);
      $scope.newStall = false;
    }
```

This adds the new stall to the stalls array.  It also clears out the form ready for the stall.  Have a play around!

This is just saved on the client side.  If you refresh the page you items will disappear. We will need to link into the database which will be done later on in the course. For now we will work on user validations and highlighting errors using Angular.


Form Validations
_________________

In Rails we would have to check once the form was submitted and do validations on the model side and send back an error.  Angular allows us to notify the user as they fill in the form on some of the validations making it a much easier task.

HTML5 also provides some validation - input a word into the price box and we can see the HTML validation.   However we want to provide out own validation.

We add a `novalidate` term to the end of our form.  We also give it a name:

```
  <form name="stallForm" ng-submit="addStall()" novalidate>
```

This turns off the HTML validation.

We then require some fields - in this case name and price. We add required at the end of the HTML input element.

```
    <input type="text" ng-model="newStall.name" required><br>
    <input type="number" ng-model="newStall.price" required><br>
```

Above the form let's add a message:

```
  <aside>Form is {{stallForm.$valid}}</aside>
```

Try filling in the form - as we add fields the form becomes valid.  We have turned off the html validation which only worked when the form was submitted.  However using angular's data binding we are constantly checking whether the form is valid. Doesn't is annoy when you hit submit on a form and you get errors?  Here we can flag when the form is valid.  Lot's of options such as highlighting boxes etc....

Now we only want to run the addStall function when the form is valid.

```
  <form name="stallForm" ng-submit="stallForm.$valid && addStall()" novalidate>
```

Test it out - input true data and see it getting added.  Try not entering a price and see how nothing gets added.

It's great that our form isn't submitting - but unless we provide feedback to the user this can get pretty annoying.

Open up web inspector and check out the form and each input box.  Look at how the classes on the boxes change as we change data within them.  The main classes are:

* "ng-clean ng-valid"
* "ng-dirty ng-invalid"
* "ng-dirty ng-valid"


We can set these as styles in our CSS - below is an example. There is a slightly more advanced set of styles at the bottom of the style.css file - uncomment these and refresh the page.

```
  .ng-valid.ng-dirty {
    border: 2px solid green;
  }
  .ng-invalid.ng-dirty {
    border: 2px solid #ff7373;
  }
```

The classes also show which of the validations is failing.  For example on price we can set min="1" max="10"

```
  <input type="number" ng-model="newStall.price" min="1" max="10" required /><br>
```

If the max is invalid the ng-invalid-max class is added to the form and to the input box.

Inside the form tags add the following container:

```
  <div class="warning-number">Price must be less than 10</div>
```

This displays a message if our input is above 10. We can add more messages to help the user.

However when we submit the form it is still "dirty". We want a clean, pristine form after we have submitted.

Now let's clean that form.  Add this line within the addStall function:

```
  $scope.stallForm.$setPristine();
```

Now when we click on the form and submit - afterwards the form "cleans" itself.

Let's remove the "Form is false" aside too, and we're done.















