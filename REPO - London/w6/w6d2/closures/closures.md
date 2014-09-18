# Closures

Fewer global variables is "better". So far we've managed to reduce our pollution of the global scope to just one variable housing our app's module.

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


To remove our "myApp" object from global scope, we can wrap it in a closure - everything works just as it did before, but now, the browser console has no idea about the `myApp` object.

```
 <script>
    (function () {
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
    })();
  </script> 
```
  


