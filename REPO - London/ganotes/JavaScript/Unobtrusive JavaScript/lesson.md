# Unobtrusive JavaScript

- Yesterday we did some basic, old-school JavaScript. 
- But it's not really much separation of concerns! 
- We've got code in our HTML, ick. 
- We've put our code in the global scope - anyone can access our functions. 
  - Which means anyone can overwrite our functions
  - Or other people can overwrite ours by accident. 



# Progressive enhancement vs graceful degradation

- Remember how we talked about stacks? You can think of the front-end of our app a bit like a stack.
- We've got HTML at the front, but we've also got CSS, and JavaScript. 
- We can use JavaScript to make our interfaces nicer, but we shouldn't rely on it. 
- If we have a pure-HTML version then it will work on a lowest common denominator system, which means it'll be more resilient. 
- If we then add fancy CSS and JavaScript on top of it, we are *progressively enhancing* our app. 

- The alternative is to make it as fancy and clever as we can, and then try to make it work without those things. 
- This is *graceful degradation*. 
  - I find this harder. 
  - I don't like it.

- We recommend you approach your development with progressive enhancement; there's less to go wrong and it keeps your feedback cycle short.


# Exercise: convert previous calculator into something unobtrusive. 

- Move code to a separate file
- Look for events instead of onclick handlers
  - Use addEventListener on Elements, which takes an event to listen for and a function object.
    ```
    var el = document.getElementById('foo');
    el.addEventListener('click', function() { 
- Disable JS and look how it posts. 


# Modules
- One common approach to this is putting stuff in to app "modules". 
- Instead of creating a bunch of things in our global scope, we create one global and put everything in it. 
  ```
  var myApp = myApp || {}; 
  myApp.reverse = function(val) { 
                    return val.split('').reverse().join('');
                  }
  ```

# Closures
- But we can also do things that don't have ANYTHING in the global scope.
- Remember our anonymous functions from yesterday? 
  - What if we invoked them immediately?
  ```
  var bar = (function() { 
    var i = 0; 
    return { 
      foo: function() { 
        console.log(i);
        i++;
      }
    };
  })();
  ```
  - We can use this to keep stuff completely hidden from the global scope.
  - Don't worry too much about how this works; just be aware of it, as you may see it in the real world.




# jQuery: isn't this a ballache? 

- So we've been scrabbling around with our document.
- This is kind of a pain to get elements, isn't it? 
- What happens if we open our page in IE? 
  - addEventListener isn't supported in browsers older than IE8. 
  - Some older browsers insist on the last parameter of the addEventListener being supplied. 

# And these are two reasons we use jQuery. 

- jQuery is a library that makes JavaScript nicer to work with. 
  - Smooths out cross-browser inconsistencies
  - Makes it much nicer to get access to DOM elements
  - Provides utilities for common tasks, like AJAX and some pretty stuff. 

# jQuery basics. 
- The $ is your friend. It's the jQuery Swiss army knife. 
  - You'll use it to get elements to work with.
  - And to get jQuery objects, which support more methods than regular DOM objects. 
  - Mention $ naming convention (`var $foo`)
  - It's also got some utility methods on it. 
- You'll also use http://api.qjuery.com a lot. A LOT.

# Exploring the dollar
- Initial setup: 
  - Download jQuery
  - Include it in our page
  - Make sure it's available in the console. ($)
- Get elements 
  - by tag name `$('li')`
  - by ID `$('#name')`, `$('#greeting')`
  - by Class
    - Add a class `number` to each LI
    - Then do `$('.number')`. 
- Easier event listening.
  - `$('#greeting').click(function() { alert("You just clicked the greeting!"); });`
  - `$('.number').click(myApp.rotate);
  - Show off event bubbling
    - $('ul').click(myApp.rotate);
- Change elements
  - $('#greeting').text('Lol');
  - $('#greeting').addClass('big');
  - $('#greeting').removeClass('big');
  - Will need to add `<style>.big { font-size: 300%; }</style>` to our header for the last to have an effect. 
- Iterators
  - $.each(myApp.colours, function(i, item) { console.log(item); });


# Let's convert our example to use some jQuery. 
- Document selectors
- Content modification
- Event handlers
- Some wizz-bang effects that are built in.
  - slideDown() the first time we show something. 
  - slideUp() and slideDown() the second time. 


# jQuery lab: a to-do list
- You've seen enough jQuery now to be able to make a simple to-do list. 
- You'll need to be able to add new items, and mark them as done. 
- Sounds like you'll need some form elements to add an item... 
  - And some event listeners to add it to the list of items. 
- I recommend using an HTML list to add items to, with a link that removes them/marks them as done. 
- Use CSS! 
- It's better to add and remove classes rather than manipulate styles directly. 

