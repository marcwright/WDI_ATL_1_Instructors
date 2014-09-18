# Unobtrusive JavaScript

Yesterday we did some basic, old-school JavaScript. 

But there wasn't really much separation of concerns! 

We've got code in our HTML; this is a 'smell' in our code. 

We've put our code in the [global scope](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Functions_and_function_scope) - anyone can access our functions.

  - Which means anyone can overwrite our functions
  - Or other people can overwrite ours by accident

Making our JS unobtrusive means seperating it from our HTML content, and ensuring to the best of our abilities that it operates in the least surprising way across the majority of user agents (web browsers, phones, search bots...).


## Progressive enhancement vs graceful degradation

Remember how we talked about stacks (of software that works together)? You can think of the front-end of our app a bit like a stack.

- We've got HTML at the front, but we've also got CSS, and JavaScript. 

- We can use JavaScript to make our interfaces nicer, but we shouldn't rely on it. 

If we have a pure-HTML version then it will work on a lowest common denominator system, which means it'll be - more resilient. 

If we then add fancy CSS and JavaScript on top of it, we are *progressively enhancing* our app. 

The alternative is to make it as fancy and clever as we can, and then try to make it work without those things. 

- This is *graceful degradation*. 
  - This is generally harder (to work out retrospectively how to make your functionality work without JS) 
  - It's generally not as comprehensive (noscript blocks and "please use a browser with JS" messages) 
  - __Do the other way first; there's less to go wrong and it keeps your feedback cycle short.__


## Progressive enhancement

Take the previous code for an onclick event, and make the JS unobtrusive:

```
  <!-- existing code -->
  <html>
  <head>
  </head>
  <body>
    <button onclick="alert('Hello WDI!');">I'm a button!</button>
  </body>
  </html>
```

Give the element an ID, remove the event from the element, and add an 'event listener':


```
  <html>
  <head>
    <script>
    function sayHello() { 
      alert('Hello WDI!'); 
    }
    
      var helloButton = document.getElementById('helloButton');
      helloButton.addEventListener('click', sayHello);
    </script>
  </head>
  <body>
    <button id="helloButton">I'm a button!</button>
  </body>
  </html>
```

However, this doesn't work... because the `eventListener` is being called before the document is loaded (so the helloButton element does not exist)

You will see the error `Uncaught TypeError: Cannot call method 'addEventListener' of null ` (or similar) in your console.

To solve this, the simplest solution is to move the script to the bottom of the page. This is one approach to ensure the document is loaded before running JS files. This also has the side benefit of making sure that any blockers in your JS (like alerts, or even slow api calls or slow logic) don't stop the user from seeing HTML content.

Or we can wait to execute our JS once the browsers tells us the document is finished loading.

Different browsers impliment different methods for determining this, and some JS libraries (like jQuery, which we haven't covered yet) offer simple solutions that work for the majority. But one method that works for our case (because it's only our code we're running, and we know nowhere else calls the same method) is to use `window.onload`:

```
  <script>
  function sayHello() { 
    alert('Hello WDI!'); 
  }
  
  function setup() {
    var helloButton = document.getElementById('helloButton');
      helloButton.addEventListener('click', sayHello);
    }
    
    window.onload = setup;
  </script>
```

As soon as we incorporate any other JS libraries, the `window.onload` can trample on their implementations of this 'document ready' method, or they may trample on ours.

Instead of `window.onload` we can add an event listener, either to the window, or the document... which will work for *most new* browsers:

`document.addEventListener('DOMContentLoaded', setup);` or `window.addEventListener('load', setup);`


