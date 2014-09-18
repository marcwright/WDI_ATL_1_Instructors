# Intro to JavaScript

## Objective

- Students understand why we use JavaScript
- Students understand the differences between JavaScript and Ruby syntax 
- Students understand how to write basic JavaScript and run it in the browser
- Students can do basic DOM manipulation using native JavaScript.
- Students can use the console for exploration and debugging.
- Students can create objects and understand the difference between classical inheritance and prototypical inheritance. 


## Outline

### Intro

- What programming languages have we seen so far? 
  - Ruby
  - HTML (Markup)
  - CSS (Nope)
  - SQL (Query)
  - erb (Kinda? Markup and programming, but Ruby)
  - YAML (Markup)
- Today we're doing JavaScript. 
  - Just another programming language, and you've learnt programming so far, not just Ruby
  - But it's going to look very different. 
- Why do we use JavaScript? 
  - Generally for front-end dev (which means it runs on the browser) 
  - No real reason why, except that Netscape wanted something Java-like and Ruby was unknown at the time. 


### Differences 

- Let's add two numbers together
  
  ```
  function add(a, b) { 
    return a + b;
  }
  ```

  - `function`, not `def`
  - We have to explicitly `return`, it doesn't happen automatically. 
  - We need a semicolon at the end of the line. 
  - We need brackets to indicate the start and end of the function.
  - We need parentheses around the method arguments. 

- Let's reverse a string. 

  ```
  function reverse(string) { 
    var result = ""
    for (var i = string.length-1; i >= 0; i--) { 
      result += string[i];
    }
    return result;
  }
  ```
  
  - Got a new for loop, explain that. 
  - Variables have 'var' before them.
  - But we can still use += to add strings together. 
  - And we can still get access to characters of a string, we can still use `string[i]`. 


### Let's jump in

- When we write JS we generally do it in a browser. 
- The browser is not JavaScript. You can write JavaScript outside of a browser. We're not going to though. 


- Create a JS file with an alert in it
- Create an HTML file that loads it
- Open it in the browser. 

- Let's do hello world. 
- Let's ask for 5 items, and then reverse them. 

```
var items = [];
for (var i = 0; i < 5; i++) { 
  items.push(prompt("Please enter item " + i));
}
alert("Your items are: " + items.join(", "));

- Let's ask for two numbers, and add them
  - parseInt

### Watch out! 

- JS will *coerce* things for you, like duck typing, but it'll not always do what you think it should...
  `"37" - 7 // 30`
  `"37" + 7 // "377"`
  `parseInt("37") + 7 // 44`
  `parseInt("foo") + 7 // NaN`

- JS has null instead of nil... but it also has undefined. 
  
  ```
  var a = null;
  a + 2 // 2, because null -> 0
  var b; // undefined;
  b + 2 // NaN
  ```

- Some things in JS are falsey that are truthy in Ruby. 
  ```
  if (false) { 
    alert("False is truthy!");
  }
  if (0) {
    alert("number 0 is truthy!");
  }

  if ("") { 
    alert("A blank string is truthy!");
  }

  if ("0") { 
    alert("The string 0 is truthy!");
  }
  ```

### Some other bits 
- if/else/elseif
- while loops
- switch/case
- try/catch, throw  


### Object literals

- Ruby had hashes. JS doesn't have hashes. 
- JS has objects. You've already used them. 
  - JSON == JavaScript Object Notation. 
  - This looks a bit like a hash, doesn't it? 
  - JS objects are a collection of name/value pairs. And some of those values can be functions. 

  ``` 
  function foo() { 
    alert("I'm foo!");
  }

  bar = function() { 
    alert("I'm bar!");
  }

  foo();
  bar();
  ```

- We don't have to create classes before we create objects...
  ```
  cat = {
    name: "Fluffy", 
    sound: "Miaow", 
    talk: function() { 
      alert(this.sound + ", " + this.sound);
    }
  };

  cat.name; // "Fluffy"
  cat.sound; // "Miaow"
  cat.talk();
  ```

- But we can create functions that return objects...
  ```
  function Cat(name) { 
    this.name = name;
    this.sound = "Miaow";
    this.talk = function() { 
      alert(this.sound + ", " + this.sound);
    };
  }

  mittens = new Cat("Mittens");
  maru = new Cat("Maru");
  mittens.talk();
  mittens.name;
  maru.talk();
  maru.name;
  ```


### Your turn 

- Write a small program that asks a user for a number. If it's a multiple of 3, output 'fizz'. If it's a multiple of 5, output 'buzz'. If it's a multiple of 3 and 5, output 'Fizzbuzz'. 
- A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 * 99. Find the largest palindrome made from the product of two 3-digit numbers.
  - Sounds like you're going to want some kind of loop...
  - Maybe two loops.
  - And a function that determines whether a number is a palindrome or not. 
  - And some part of your code that remembers the largest palindrome it's seen so far. 


### The DOM and the web browser

- As I said before, JavaScript is not the same as the web browser. And the web browser is not the same as JavaScript. You can run your JavaScript code without a web browser. But it is a pain. 
- And generally, we want to write stuff in the browser. 
- We do this via the DOM. We've seen this a little bit in 'Inspect Element', and seen our elements as trees. But the DOM is also what lets our code manipulate stuff in the browser. 
- The DOM lets us do two things: manipulate the document, and run code when things happen. 

#### Event driven programming

- We've written a couple of different kinds of programs so far. Imperative ones, and object oriented ones. 
  - Imperative code that starts at the top line, and chugs down through it until it finishes. 
  - Object oriented programs, where we define a bunch of objects and then our code jumps around as necessary. 
- But we've also written event-driven programs, though we haven't called it that. 
  - When our web server runs, it sets up our app and then just sits there. 
  - It's not until something happens - an event - our visit to the web page - that our code runs. 
- JS is a bit like that. 

```
<html>
<head>
</head>
<body>
  <button onclick="alert('Hello WDI!');">I'm a button!</button>
</body>
</html>
```

```
<img src="normal.jpg" onmouseover="this.setAttribute('src', 'mouseover.jpg')" onmouseout="this.setAttribute('src', 'normal.jpg')" width="200" />
```

```
<script>
// Rotate the colours whenever we click a button. 
var colours = ["red" , "orange", "yellow", "green", "blue", "purple", "silver"];
var count = 0;
function rotate() { 
  var listItems = document.getElementsByTagName('li');
  for (var i = 0; i < colours.length; i++) { 
    var listItem = listItems[i];
    listItem.setAttribute('style', 'background-color: ' + colours[(i+count)% colours.length]);
  }
  count++;
}
</script>
<ul>
<li>First</li>
<li>Second</li>
<li>Third</li>
<li>Fourth</li>
<li>Fifth</li>
<li>Sixth</li>
<li>Seventh</li>
</ul>
<button onclick="rotate()">Disco!</button>
```

```
<p id="greeting">Hello!</p>
<input type="text" id="name" onchange="update()" />
<script>
function update() {
  var caption = document.getElementById('greeting');
  var input = document.getElementById('name').value;
  if (input) { 
    caption.innerHTML = "Hello, " + input + "!";
  } else { 
    caption.innerHTML = "Hello!";
  }

}
</script>
```
- What happens if we change this from 'onchange' to 'onkeydown'? 
- Why? 
- Make it 'onkeyup' instead. 

- TODO TODO CHILD ELEMENTS


### Pre-lab prep

- We've seen how we can ask the user questions. 
- We've seen how we can make things happen when buttons are clicked.
- We've seen how we can read input from the page, and output things to the page. 
- So, can we do Calc-it? 
- Yes we can! 

### Lab

- Do a basic calc-it in the browser. 
- Add, subtract, multiply, divide. 
  



-----------------------------

#FINI


### Inheritance
 
- With some languages, like Ruby, we say they have *classical inheritance*. It's not about being *classic*; it's about being *class*-based. We create objects, which are instances of a class. 
- JavaScript doesn't have Classical inheritance. It has *prototypal inheritance*. Our objects inherit directly from other objects. 


        

### Resources 

- MDN: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference?redirectlocale=en-US&redirectslug=JavaScript%2FReference
- JavaScript puzzlers: http://javascript-puzzlers.herokuapp.com
