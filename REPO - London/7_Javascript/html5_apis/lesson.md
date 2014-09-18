# HTML5 APIs

[i]:
## Objective
- Students should have an idea of what HTML5 is
- Students understand that HTML5 created a whole bunch of new APIs
- Students understand that they're not widely supported
- Students understand how to detect whether there's support or not
- Students have a broad overview of what APIs there are available. 


## Lesson 

Today's lesson is not just about typing. You're going to have to think for yourselves.

So let's recap! 

We've used JavaScript to make our web sites more interactive. We can do things in the browser instead of on the server. 

We've used JS to make our pages feel more responsive, and smoother for the user. 

We've used it to make things slicker/prettier. 

But let's take a step back. What if we weren't web developers. What if we were a business? A business that wants to make some software? 

If we were trying to decide between making something web-based and a 'native' app, what might be our decision-making factors? 

  - What kind of stuff can we do in a native app that we can't do on the web? 
    - Offline access (ie. without an internet connection)
    - Access to webcam, microphone, etc
    - Access to printer
    - Complex graphics
    - Accelerometer access
    - Geolocation
    - Vibration motor
    - Pop-up alerts/notifications
  - What kind of stuff haven't we done in our JS apps so far? 
    - Making them work offline
    - Storing data locally
    - Manipulating the URL bar
    - Seeing whether the tab is currently active or not. 

Well... changes are afoot. 

The thing about HTML5 is that it isn't actually a standard. It's a collection of proposals and implementations and suggestions. 

  - Some are better-supported than others. 
  - Some are set to become standards. Some are basically there already. Some will die on their arse. 

Welcome to the internet. Things change. 

So don't 100% rely on anything we talk about today. 

But there's normally a way to work around older browsers.

Most of what we're doing with these things is 'gilding the lily'; making them better for users, but it's not required. 


## Let's take a look. 

Let's fire up our stock server from the other day 
[i]: or provide starting point code

It would be nice if we had a history of past stock results. 

We could build a Rails app to store a history of Stock requests; but if I could store them in the browser, I don't have to set up models and CRUD on my server.

[i]: Google for 'browser store ajax history'
Find the stackoverflow page: http://stackoverflow.com/questions/29886/how-to-keep-the-browser-history-in-sync-when-using-ajax

Looking online, we find out quite quickly that we can store the history of our AJAX requests (including the data that was in them, to be able to navigate forward and backward in browsing history).


### Feature list

So, let's modify our AJAX call to store the past quotes each time we retrieve them.

And modify our page to show them if they're present. 

We will also look at rearranging the JS to make this easier. 


## Code-along

First, let's tidy up some of the functionality of this code before we add new features.


### Double submit

When we submit the form, the AJAX request fires, but there's nothing to stop the user from submitting again before the AJAX request has come back.

This risk of 'double submit' can cause confusing and annoying issues in real-life code bases - customers can 'buy twice' for instance.

We can disable our submit button after it's clicked by altering it in the `startLoading` function.

```
  // startLoading()
  var $submitButton = $('form input[type="submit"]');
  $submitButton.attr('disabled', true).val('Please wait...');
```

And enable it again when loading has ended.

```
  var $submitButton = $('form input[type="submit"]');
  $submitButton.attr('disabled', false).val('Query');
```


### jQuery functionality

When the AJAX call returns data, the success function loops through the values and updates the displayed attributes.

As each one gets updated, we manually alter the background colour up through the various shades of yellow; and then back down again.

That 20+ lines of code is able to be replaced by the jQueryUI 'effect' functionality.

```
  # layout.erb
  <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.0/jquery-ui.min.js"></script>

  // application.js, update()
  $el.effect('highlight', 1000);
```

We can also extract the loop from the success callback, and move that to the update function too. 

```
  // application.js
  function update(data) {
    var thingsToUpdate = ['name', 'symbol', 'lastTrade', 'time', 'date', 'updatedAt'];
    $.each(thingsToUpdate, function(i, thing) {
      $thing = $('#' + thing);
      $thing.text(data[thing]);
      $thing.effect('highlight', 1000);
    });
    if(!$('#quote_container').is(":visible")) {
      $('#splash_container').hide();
      $('#quote_container').show();
    }
  }

  // In the AJAX success callback of 'document ready'
  update(data);
```


### .ajax() Syntax

We're currently using a long-hand syntax for AJAX calls. We could refactor it to instead use a shorter syntax.

Let's take the success function, and store it in a variable.

```
  var successHandler = function(data) {
    update(data);
  }
```

And alter the `$.ajax` call.

```
  $.ajax({url: '/' + stockSymbol}).success(successHandler).complete(endLoading);
```

We could even now get rid of the variable, and just call the `update` function... but we might add some more functionality to the `successHandler` in a moment, so let's leave it there for now.


## Next steps

So with a bit of refactoring, we've made our code two-thirds the size, and have tidied up some of the functions, and we've also added some extra functionality (remember, new functionality is *not* 'refactoring')

One of the concerns you all had yesterday was that the URL doesn't update when we do our AJAX requests. No matter how many form submissions we make, the 'back' button goes back to the last page, not the last stock quote we searched for,

Well, we can do that. We can use the "(HTML5 history API)[https://developer.mozilla.org/en-US/docs/Web/Guide/API/DOM/Manipulating_the_browser_history]".

It's got two main pieces of functionality:

  - a `pushState` method, that you can use to store some state AND update the URL. 
  - and a `popState` event, that you can get one state back with it.

[i]: https://developer.mozilla.org/en-US/docs/WindowEventHandlers.onpopstate

Push and pop? Sounds like an array. and indeed it is; in fact it's a "stack". A stack is a data structure that gives us "First In, Last Out" access.


## Lab Time

So... your job is to now investigate the API documentation, and implement these features.

  - Whenever we get a new stock symbol, we should call pushState to save the new data and update the URL. 
  - Whenever the user clicks 'back', our window object gets a `popstate` event. You should register an event handler that receives it, and restores the page state.


[i:]
### Steps to complete lab - or to complete as codealong

[i:]
After the `updatePage()` call in the `successHandler` function, push to the history.

[i:]
```
  if (typeof history !== "undefined") {
    history.pushState(data, "whatever", "/" + data.symbol);
  }
```

[i:]
Add an eventhandler for `popstate`.

[i:]
```
  $(window).on('popstate', function(event) {
    console.debug("Restoring page state via HTML5 history");
    updatePage(event.originalEvent.state);
  });
```

[i:]
Notice what happens when you add a couple of pages to the history and go back... what happens when you get to the first page?

[i:]
  - in the console there's an `Uncaught TypeError: Cannot read property 'name' of null` - because the event's 'originalEvent' property doesn't have any 'state' value.
  - so we need to store the state of the page when it loads, to swap in there.

[i:]
```
  // 'document ready'
  var originalContent = $('#content');
```

[i:]
``` 
  // update the eventhandler to use the original content if necessary
  $(window).on('popstate', function(event) {
    if (event.originalEvent.state) {
      console.debug("Restoring page state via HTML5 history");
      updatePage(event.originalEvent.state);
    } else {
      console.debug("Restoring page state using smelly jQuery swapping.");
      $('#content').replaceWith(originalContent);
    }
  });
```







