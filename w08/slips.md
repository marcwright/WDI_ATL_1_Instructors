1. Explain the difference between a referencing and invoking a function
  - referencing a function returns the function's code as data
  - invoking a function actually executes the function's code block
1. Explain what an anonymous function is and give an example of when you might use one
  - an anonymous function is any unnamed function. We often pass anonymous functions as arguments to other functions, so that it can be executed at a later date. Anonymous functions are also frequently stored as properties of objects, so that they can be called as methods on those objects
1. Describe what first-class functions are
  - first class functions can:
    - be passed to other functions as arguments
    - be returned by other functions
    - be assigned to variables 
    - be assigned as properties of objects
1. Name the four patterns of function invocation, and the context assumed with each
  - function invocation, in which 'this' will refer to the global object (the `window` object in the browser)
  - method invocation, in which the function call is attached to an object. 'this' will refer to the object in question
  - .call() and .apply() invocation, in which the programmer is allowed to manually set the context
  - constructor invocation, ie: `new ObjectType()`, in which context will be the instance of `ObjectType`
1. Explain variable scoping rules, and the effect of the `var` keyword
  - a variable declared with the `var` keyword will be scoped to its current code block. In the case of variables declared outside of any function, they will be scoped globally, meaning they will will be available throughout the script. When you don't use the var keyword, the assignment will travel up through the scope chain, looking for a matching variable name. If no match is found, that variable sets itself in the global scope.
1. Use a `for` loop for iteration
1. Create objects using a constructor function
1. Declare three functions in JavaScript: an anonymous function, a named function, and a constructor
1. Explain what Underscore.js is and why you would use it
  - Underscore is a JavaScipt library that provides a litany of utility functions for common programming tasks
1. Explain the importance of namespacing and how `_` is a namespace for the underscore library
  - Namespacing is the technique employed to avoid collisions with other objects or variables in the global namespace. They're also extremely useful for helping organize blocks of functionality in your application. Underscore only declares one global variable, _ , and attaches all of its helper functions as properties of this _ object. 
  - It's not uncommon for variables to get unknowingly and problematically reassigned by members of software development teams, so to mitigate this problem the software community uses namespacing as a system for not clouding the global namespace.
1. Use setTimeout to execute code after a specific delay
1. Explain what a stub is, and how it aids in validating application behavior.
  - a 'stub' is any kind of pretend object used in place of a real object for testing purposes. They are typically used so that the object you're testing gets the data it needs to do its job. Factoid: the name comes from the notion of a 'stunt double' in the movies.
1. Explain the difference between a responsive website and a mobile-specific website
  - responsive allows you to have a single site that adapts to the size of the screen of the device in question
    - because there's a single URL, responsive sites don't require time-consuming redirects, like mobile sites do
    - you don't have to start afresh with new SEO buildup
    - it's cheaper. maintaining one website is better than maintaining distinct websites
    - the marketing team doesn't have to worry about marketing for two different websites
  - mobile sites 
    - mobile sites are designed specifically for mobile devices
    - they typically have a smaller overall payload (smaller stylesheets, less javascript)
1. Explain what an @media query is and what it does
  - @media queries let the presentation of content be tailored to a specific range of output devices (an example being a mobile with a screen size between 800px and 1200px)
1. Use jQuery to select elements from the DOM, and dissect the format of your code.
1. Use jQuery to create a new element. Then give it the class, "officer"
1. Use jQuery to bind event listeners to elements.
1. Differentiate between a text node and an element node.
1. Describe what model/view separation is, and why it's important.
  - Model/View separation is the decoupling of business logic/data and that data's presentation. Consider the following scenario: a specific data entry is presented in different formats on different pages of a website. It's logic is built into each format (view), repeated each time. Should that logic or data change, we would have to change it in 7 different places, as opposed to just one.

