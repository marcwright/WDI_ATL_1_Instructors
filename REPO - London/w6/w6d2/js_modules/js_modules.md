# JS Modules

As we've seen, it's possible that different JS files and libraries can override the definition of each others' functions if everything is written in 'global' scope.

We can 'scope' our functions to avoid conflicts with other people's (or other libraries') code. 

We need to instanciate a new object to tie all our functionality to; add the existing functions to properties on my scope object; and alter the calls to the functions to refer to the new scope:

```
  <script>
    var myApp = myApp || {}; 
    
    myApp.sayHello = function () { 
                       alert('Hello WDI!'); 
                     }
  
    myApp.setup = function () {
    var helloButton = document.getElementById('helloButton');
      helloButton.addEventListener('click', myApp.sayHello);
    }
    
    document.addEventListener('DOMContentLoaded', myApp.setup);
  </script>
```

The result of this is that instead of creating a bunch of things in our global scope, we create one global and put everything in it.

We can extend this, as our app grows, by creating "submodules"; other JS files that we write can access our existing scope and extend it:

```
  <script>
    var myApp = myApp || {}; 
    var myApp.subModule = myApp.subModule || {}; 
    
    myApp.subModule = function () { 
                       alert('Hello from the submodule!'); 
                      }
  </script>
```

Whether or not the extra file is included, it should not clash with other code - and if all our code follows this approach, then nothing should clash. Should...


# CSS/JS interaction

We can use manipulation of CSS to manage the display to the user in the event of JS not being enabled. Essentially, if JS *is* enabled, we will remove the CSS class that controls the hiding of buttons and the display of the warning message.



```
  <html>
  <head>
    <style>
      /* stuff that happens if JS is enabled (ie. _don't_ show the "you've not got js" warning) */
      .nojs_warning {
        display: none;
      }

      
      /* stuff that happens if JS is disabled (ie. show the "you've not got js" warning, and hide all the buttons that have js events) */
      .nojs button {
        display: none;  
      }
      .nojs .nojs_warning {
        display: block;
      }
    </style>
  
    <script>
      var myApp = myApp || {}; 
    
      myApp.sayHello = function () { 
                         alert('Hello WDI!'); 
                       }
  
      myApp.setup = function () {
      var helloButton = document.getElementById('helloButton');
        helloButton.addEventListener('click', myApp.sayHello);
      
        var body = document.getElementById('body');
        body.className = body.className.replace(/nojs/, '');
      }
    
      document.addEventListener('DOMContentLoaded', myApp.setup);
    </script>
  </head>
  <body class="nojs" id="body">
    <button id="helloButton"">I'm a button with JS event!</button>
    <p class="nojs_warning">You need JS to view this site best...</p>
  </body>
  </html>
```

Instead of putting the class on the body, you could put it on all the elements concerned... the detail of the implimentation is your choice :-)
