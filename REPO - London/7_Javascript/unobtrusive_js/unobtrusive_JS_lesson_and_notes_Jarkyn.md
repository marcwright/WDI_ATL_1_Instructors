# Unobtrusive JavaScript

###Intro
Making our JS unobtrusive means separating it from our HTML content, and ensuring to the best of our abilities that it operates in the least surprising way across the majority of user agents (web browsers, phones, game consoles..., search bots…)

###Separation of concerns

- Yesterday we did some basic, old-school JavaScript. 
- But it's not really much separation of concerns! 
- We've got code in our HTML, ick. 

Lets look at the example (this is an index.html within the unobtrusive_js folder):

```
	<!DOCTYPE html>
	<html>
	  <head>
	     <title>JS musings</title>
	  </head>
	  <body>
	    <button onclick="alert('clickedI!');">click me</button>
	  </body>
	</html>
```

The event handler is used as an attribute on our HTML element. That's pretty unacceptable by current standards.
Let's make it unobtrusive…

We can start with separation of concenrns:
HTML is for content, CSS is for styles, and anything that responds to the user bahaviour should be taken care of by JavaScript. So we are reacting to various events set by user lets transfer our code into a separate JS file. 


- create main.js within the same folder as index.html (I am currently within unobtrusove_js folder, where my index.html is atm)
- include the main.js in our html using script tags: <script type="text/javascript" src="main.js"></script>
- to check that our file was included properly type in main.js `console.log('hello, this is your js file')`
- open index.html in the browser and open the javascript console in developer tools, you should see the message, if you are not seeing it, you must be not including it properly.
- once js file is included in our page, we can start transfering the code there
- lets remove the horrible inline event handler on our button, and assign the id to our button instead so that we have something to select it with:

index.html: 

```
	<!DOCTYPE html>
	<html>
	  <head>
	     <title>JS musings</title>
	  </head>
	  <body>
	    <button id="button">click me</button>
	  </body>
	</html>
```
- then in our js file, we select the button by its id and store it in the variable and we attach a listener to this button element:

main.js:

```
var button = document.getElementById('clickMe');
```
- next I will attach an event to this element:

```
button.addEventListener('click', showMessage);
```
at the moment the callback I am passing into the event listener is showMessage, i have not yet defined it, we will do that next

```
function showMessage(){
  console.log('clicked!!!')
}
```

now i have selected the element, i attached an event and I passed in the funciton to be run when event occurs, if I refersh I expect to see the log in the console

- and its failing :(, I am getting the error: Uncaught TypeError: Cannot read property 'addEventListener' of null 
this is happening because I am attempting to select an element with JavaScript before the DOM loaded. So lets add an event listener to the window and only perform the element selection and event attachment when the window load event happened:

```
window.addEventListener('load', function(){
    var button = document.getElementById('clickMe');
    button.addEventListener('click', showMessage);
});
```
note that here the callback we passed into the event listener for the window load is an anonymous function, where's the callback we passed into the event listener for the button was a name of the function defined further down. Two ways to do the same.


So now this should work! and our JS is all lovely and unobtrusive… well almost, there are still things we can do to take it even further


###Polluting the global scope

So far we've been putting our code in the global scope, anyone can access our functions. And if we start including various libraries/plugins this means that:
  - libary code could overwrite our functions.
  - Or we could overwrite library's/plugin's code by accident. 
  

Generally speaking we don't want to be defining our variables/functions on the global scope. The general approach we take is that we define one thing/object on the global scope and evertyhing else is encapsulated within that. This approach has couple of implementations:

####Namespacing (or 'modules')

this is a straightforward technique, where you are setting one object on the global scope and everything else you need to access is a property on that object

```
  var myApp = myApp || {}; 
  myApp.reverse = function(val) { 
    return val.split('').reverse().join('');
  }
```

here _reverse_ is a property set on the myApp object and it stores the function, so if I was to call `myApp.reverse` that would return that function, and if I need to call it I would use `myApp.reverse()`


this is how first example of this lesson looks reworked with namespacing 
(first example is worked on in _Separation of concerns_ paragraph above):

```
	var myApp = myApp || {};
	
	myApp.setUp = function(){
	  var button = document.getElementById('button');
	  button.addEventListener('click', myApp.message);
	}
	
	myApp.message = function(){
	  alert('clicked');
	}
	
	window.addEventListener('load', myApp.setUp);
```


####Self-invoking functions

- Remember anonymous functions? 
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

(try checking in the console what is going to be stored in the _bar_ variable, FYI this is example which uses self-invoking anonymous function and it uses _closure_)



###Constructor functions

This is another use of functions to ensure our JS is unobtrusive. Constructor functions are used to imitate classes in other languages. These funcitons return the objects with properties of the project defined by the constructor function, ie constructo is the _'template'_, so to speak, that we use to stamp out the _'copies'_

We can represent the objects we are modelling by constructor functions, just like we represent our objects by classes in ruby:

defining the constructor function:

```
var Hero = function(name){
    this.name = name;
    this.occupation = 'Ninja';
    this.whoAreYou = function(){
      return 'My name is ' + this.name + " and I'm a " + this.occupation  
    }
} 

```
using the constructor function to _'instanciate'_ our object:

```
var hero = new Hero('Leonardo');
```
checking _hero_ in the console, it returns the object (ignore the __proto__ for now):

```
Hero {name: undefined, occupation: "Ninja", whoAreYou: function}
	name: 'Leonardo'
	occupation: "Ninja"
	whoAreYou: function (){
	__proto__: Object
 
```

so we can now access these properties by calling:

```
hero.name // 'Leonardo'
hero.occupation // 'Ninja'
hero.whoAreYou(); // 'My name is Leonardo and I'm a Ninja"
```
This is not an exhaustive list of techniques that can be used to make your JS code beautiful and readable and truly unobtrusive

# Progressive enhancement vs graceful degradation

As mentioned, at the very beginning, unobtrusive is more than just separation of concerns and good code quality. its also about ensuring to the best of our abilities that it operates in the least surprising way across the majority of user agents

Web is constantly evolving and new technologies come and go.
And not all users keep upto speed with that, companies will always want a broader customer reach, which means having to support those among users with older browsers/operating systems. 
So we need to make decisions how we are going to address the fact that our web applications may not look/function the same way for everyone.

there are two main approaches: Progressive enhancement & Graceful degradation


#####Graceful degradation

This is when you build your application with the latest technology in mind, and then you will degrade gracefully for those using older browsers. The system may not be as pleasant or as pretty, but the basic functionality will work on older systems.

Example: A simple example is the use of 24-bit alpha-transparent PNGs. Those images can be displayed on modern browsers without problems. IE5.5 and IE6 would show the image, but transparency effects would fail (it can be made to work if necessary). Older browsers that do not support PNG would show alt text or an empty space.
Developers adopting graceful degradation often specify their browser support level, e.g. level 1 browsers (best experience) and level 2 browsers (degraded experience).



#####Progressive enhancement

Progressive enhancement is similar concept to graceful degradation but in reverse. The web site or application would establish a base-level of user experience for most browsers. More advanced functionality would then be added when a browser supports it.
Progressive enhancement does not require us to select supported browsers or revert to table-based layouts. We choose a level of technology; i.e. the browser must support HTML 4.01 and standard page request/responses.

Going back to our image example, we might decide that our application should be functional in all graphical browsers. We could use a lower-quality GIF images by default but replace them with 24-bit PNGs when the browser supports them. 


######Making a choice

Progressive enhancement normally offers a more logical approach:

   * It enables you build a stable application with solid foundations that should work on any device.
   * You can add further enhancements as new technologies and browsers are introduced without changing the core functionality. On the contrary, graceful degradation requires a browser support list; you might need to update the application as new browsers are introduced.
   * Enhancements allow the user to achieve an objective quicker or easier but they are not a prerequisite. For example, a JavaScript slider might allow a user to rapidly choose a number but that value would feed into a standard and accessible HTML input box.

There are a few exceptions when graceful degradation might be suitable:

   * Cosmetic issues are usually acceptable if the system remains usable. Older browsers have more limited CSS support — layouts can be different or ugly if the core functionality remains operable.
   * A complex visual application such as Google Maps is so dependent on JavaScript that an entirely different system has been developed for users without it. That’s not to say Google Maps couldn’t be achieved with progressive enhancement, but it was probably simpler and more cost-effective to create two separate applications.

In general, progressive enhancement should offer better stability and browser support. The initial development costs are higher but the application should require less long-term maintenance.
- We recommend you approach your development with progressive enhancement; there's less to go wrong and it keeps your feedback cycle short.




##Namespacing + Constructor function + Private function example from the class

this is a complete version of the cash register code-along using namespacing alongside constructor functions, plus private function example:

pseudo code:

- set variable to store the total
- set variable for last entry/input
- select input, retrieve value
- keep track of running total
- format the currency
- update total (HTML)
- updating entries (HTML)
- reset the input

```

// console.log('js');

var myApp = myApp || {};

myApp.CashRegister = function(){
  this.total = 0; //set variable to store the total
  this.latestEntry; //set variable for last entry/input
  this.totalElement = document.getElementById('total');
  this.inputElement = document.getElementById('newEntry'); //select input
  this.form = document.getElementById('entry');
  
  // retrieve value from input:
  this.getNewEntry = function(){
    this.latestEntry = parseFloat(this.inputElement.value);
  }
  
  // keep track of running total
  this.addToTotal = function(){
    this.total += this.latestEntry;
  }
  
  //update total (HTML)
  this.updateTotal = function(){
    this.totalElement.innerText = currencyFormat(this.total);
  }
  
  //updating table of entries (HTML)
  this.updateEntries = function(entry){
    var entryHTML = '<tr><td></td><td>';    
    entryHTML += currencyFormat(entry);
    entryHTML += '</td></tr>';
    console.log(entryHTML);
    var entriesContainer = document.getElementById('entries');
    entriesContainer.innerHTML += entryHTML;
  }
  
  this.clearInput = function(){
  	this.inputElement.value = '';
  }
  
  // private function only available internally, to be used within the other functions, its not defined on _this_, ie its not going to be returned as the property of the object, and is not going to be available by calling register.currencyFormat:
  function currencyFormat(unformattedTotal){
    return '£' + unformattedTotal.toFixed(2);
  }

}

window.addEventListener('load', function(){

  // 'instanciating' the CashRegister
  var register = new myApp.CashRegister();
  //console.log(register);

  // setting a listener on the form, and running the necessary functions:
  
  register.form.addEventListener('submit', function(event){
    event.preventDefault();
    register.getNewEntry();
    register.addToTotal();
    register.updateTotal();
    register.updateEntries(register.latestEntry);
    register.clearInput();
  });

});


```


