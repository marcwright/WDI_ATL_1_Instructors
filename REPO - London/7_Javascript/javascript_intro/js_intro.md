# Intro to JavaScript

## Intro

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


## Short history of javascript 

JavaScript, not to be confused with Java, was created in 10 days in May 1995 by Brendan Eich, then working at Netscape and now of Mozilla.  In 1996 - 1997 JavaScript was taken to ECMA to carve out a standard specification, which other browser vendors could then implement based on the work done at Netscape. First, Brendan Eich and Mozilla in 2005 rejoined Ecma as a not-for-profit member. In 2005 when Jesse James Garrett released a white paper in which he coined the term Ajax, of which JavaScript was the backbone, used to create web applications where data can be loaded in the background, avoiding the need for full page reloads and resulting in more dynamic applications. This resulted in a renaissance period of JavaScript usage spearheaded by open source libraries and the communities that formed around them, with libraries such as Prototype, jQuery, Dojo and Mootools and others being released. All of this then brings us to today, with JavaScript entering a completely new and exciting cycle of evolution, innovation and standardisation, with new developments such as the Nodejs platform, allowing us to use JavaScript on the server-side, and HTML5 APIs to control user media, open up web sockets for always-on communication, get data on geographical location and device features such as accelerometer, and more. It is an exciting time to learn JavaScript.


## Differences with ruby

Let's add two numbers together
  
```
  function add(a, b) { 
    return a + b;
  }
```

- `function`, not `def`
- We have to explicitly `return`, it doesn't happen automatically.
  - If we don't return explicitly, the return value of a function will be `undefined`.
- We need a semicolon at the end of the line. 
- We need brackets to indicate the start and end of the function.
- We need parentheses around the method arguments. 

Let's reverse a string (we'll use the console in Chrome as a playground for JS - just like we use IRB for Ruby)

```
  function reverseString(string) {
    var result = "";
    for (var i = string.length-1; i >= 0; i--) { 
      result += string[i];
    }
    return result;
  }
```
  
  - JS naming convention is to have camelCase method and variable names.
  - The loop syntax, is different to what we're familiar with in Ruby. There are three parts of a JS loop:
      - There's a "this is the starting condition"
      - "this is the situation that will cause it to end"
      - "this is what to do " 
  - Variables are defined with 'var' before them - if the 'var' is missing, then the variable scope could be 'hoisted' [2] and strange results can ensue...
  - But we can still use += to add strings together. 
  - And we can still get access to characters of a string, we can still use `string[i]`. 
  - We comment with `//` for single lines or `/* comments here */` for multi-line comments.
  - JavaScript ignores spaces, tabs, and newlines that appear in JavaScript programs.
  - JavaScript is a case-sensitive language. This means that language keywords, variables, function names, and any other identifiers must always be typed with a consistent capitalization of letters.


We can output to the console using `console.log('Stuff to say in console')`, and the contents of the log message can be anything that can be 'stringified'. Logging to the console in JS is similar to 

```
  function stringChars(string) {
    for (var 1 = 0; i < string.length; I++) {
      console.log("The character at position " + i + " is " + string[i]);
    }
  }
```

If you call a function in JS that doesn't have any arguments, you still need the brackets to invoke the function.
  
```
  "my string".toUpperCase()
```
  
Without the brackets, the return value would be the function itself.


## Let's jump into Syntax

We're going to:

- Create a JS file with an alert in it
- Create an HTML file that loads it

```
  <!doctype html>
  <html>
    <head>
      <title>My First JS App</title>
    </head>
    <body>
      <h1>This will be my first JS App!</h1>
    </body>
  </html>
```

You can include JS in script tags in the source, and console logs appear in the browser console.

```  
  <script language="javascript" type="text/javascript">
    <!--
    document.write("Hello World!")
    //-->
  </script>
```

or in a separate file.

```
 <script src="application.js"></script>
```


### Defining functions

These two ways of defining functions in JS are very common. The second "anonymous" approach is like the blocks/procs in Ruby.

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


## Beyond "Hello JS World"

- Let's ask for 5 items, and then display them. 

```
  var items = [];

  for (var i = 0; i < 5; i++) { 
    items.push(prompt("Please enter item " + i));
  }

  alert("Your items are: " + items.join(", "));
```

As well as alerting, we can prompt the user for input.

Or `prompt` - in the next exercise...

```
  a = prompt('Give me a number: ');
  b = prompt('Give me another number: ');
  c = a + b;

  alert('Your numbers, added together are ' + c);
```

Oops! This breaks...


### Watch out! 

JS will *coerce* things for you, like duck typing, but it'll not always do what you think it should...

  `30 - 7 // 30`
  `"37" - 7 // 30`
  `"37" + 7 // "377"`
  `parseInt("37") + 7 // 44`
  `parseInt("foo") + 7 // NaN`

We can check the datatype of variables with the `typeof()` command.

```
  typeof(a);
  \\ 'string'
```

So the code in the previous example needs to convert the strings returned by `prompt()` into integers (or floats):

```
  a = prompt('Give me a number: ');
  b = prompt('Give me another number: ');
  c = parseInt(a) + parseInt(b);

  alert('Your numbers, added together are ' + c);
```

Some of these quirks may be addressed in future versions of JS [1], but there are so many inplementations in so many historical browsers, that changes to the implementation would break code that is written to take advantages of 
    

### Nil? Null?

JS has null instead of nil... but it also has `undefined`.

```
  var a = null;
  a + 2; // 2, because null -> 0
  var b; // undefined;
  b + 2; // NaN
```

Aside: beware of differences between languages in what constitutes errors (like division by zero), and what doesn't. In JS, `1 / 0` => `infinity`


Some things in JS are falsey that are truthy in Ruby

[i]: which also introduces us to JS `if...else...end` constructs

```
  if (true) {
    alert("truthy!");
  }
  
  if (false) { 
    alert("False is truthy?");
  } else { 
    alert("False is not truthy!");
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

__Truthiness in javascript is tough, 
  [Javascript equality table](http://dorey.github.io/JavaScript-Equality-Table/)__


## Some other operators

[i]: It's not necessary to go through in detail every line of these notes from here onwards. But certainly do cover 'Object Literals'


### Arithmetic Operators

```
  var variableA = 10; 
  var variableB = 20;
```
  
  * `+` Adds two operands variableA + variableB will give 30
  * `-` Subtracts second operand from the first  variableA - variableB will give -10
  * `*` Multiply both operands variableA * variableB will give 200
  * `/` Divide numerator by denumerator  variableB / variableA will give 2
  * `%` Modulus Operator and remainder of after an integer division  variableB % variableA will give 0
  * `++`  Increment operator, increases integer value by one   variableA++ will give 11
  * `--`  Decrement operator, decreases integer value by one   variableA-- will give 9
  

### Comparision Operators

  * `==` Checks if the value of two operands are equal or not, if yes then condition becomes true.   (variableA == variableB) is not true.
  * `!=` Checks if the value of two operands are equal or not, if values are not equal then condition becomes true.  (variableA != variableB) is true.
  * `>` Checks if the value of left operand is greater than the value of right operand, if yes then condition becomes true.   (variableA > variableB) is not true.
  * `<` Checks if the value of left operand is less than the value of right operand, if yes then condition becomes true.  (variableA < variableB) is true.
  * `>=` Checks if the value of left operand is greater than or equal to the value of right operand, if yes then condition becomes true.   (variableA >= variableB) is not true.
  * `<=` Checks if the value of left operand is less than or equal to the value of right operand, if yes then condition becomes true.  (variableA <= variableB) is true.


### Logical (or Relational) Operators

  * `&&` Called Logical AND operator. If both the operands are non zero then then condition becomes true.  (variableA && variableB) is true.
  * `||` Called Logical OR Operator. If any of the two operands are non zero then then condition becomes true.  (variableA || variableB) is true.
  * `!` Called Logical NOT Operator. Use to reverses the logical state of its operand. If a condition is true then Logical NOT operator will make * false.   !(variableA && variableB) is false.


### Assignment Operators
  * `=` Simple assignment operator, Assigns values from right side operands to left side operand `variableC = variableA + variableB` will assigne value of varibleA + variableB into variableC
  * `+=`  Add AND assignment operator, It adds right operand to the left operand and assign the result to left operand `variableC += variableA` is equivalent to `variableC = variableC + variableA`
  * `-=`  Subtract AND assignment operator, It subtracts right operand from the left operand and assign the result to left operand   `variableC -= variableA` is equivalent to `variableC = variableC - variableA`


## Conditional operators


### if

```
  if (truthy_expression){
     
  }
```


### if else

```
  if (truthy_expression){
     
  }
  else{
    
  }
```


### if else if

```
  if (truthy_expression){
     
  }
  else if (truthy_expression){
     
  }
```


### switch

This is the equivalent of Ruby's `case` statement.

```
  switch (grade)
  {
    case 'A': "Good job"; break;
    case 'B': "Pretty good"; break;
    case 'C': "Passed"; break;
    case 'D': "Not so good"; break;
    case 'F': "Failed"; break;
    default:  "Unknown grade";
  }
```

Without the `break` statements, the conditions will cascade through.


### for loop

The for loop is the most compact form of looping and includes the following three important parts:

  - loop initialization / test statement / iteration statement

```
  var count;
  document.write("Starting Loop" + "<br />");
  for(count = 0; count < 10; count++){
    document.write("Current Count : " + count );
    document.write("<br />");
  }
  document.write("Loop stopped!");
```


### For in Loop

This loop is used to loop through an object's properties.

```
  var aProperty;
  document.write("Navigator Object Properties<br /> ");
  for (aProperty in navigator)
  {
    document.write(aProperty);
    document.write("<br />");
  }
  document.write("Exiting from the loop!");
```


### while

```
  var count = 0;
  document.write("Starting Loop" + "<br />");
  while (count < 10){
    document.write("Current Count : " + count + "<br />");
    count++;
  }
  document.write("Loop stopped!");
```


### do while

```
  var count = 0;
  document.write("Starting Loop" + "<br />");
  do{
    document.write("Current Count : " + count + "<br />");
    count++;
  } while (count < 0);
  document.write("Loop stopped!");
```


### try catch

```
  function message() {
    try {
      adddlert("Welcome guest!");
    }
    catch(err) {
      var text = "There was an error on this page.\n\n";
      text += "Error description: " + err.message + "\n\n";
      text += "Click OK to continue.\n\n";
      alert(text);
    } finally {
      alert('I always run, errors or not');
    }
  }
```


## Arrays

```
  var fruits = new Array( "apple", "orange", "mango" );
  var fruits = [ "apple", "orange", "mango" ];
```

Mehods and properties:

  * []
  * length  Reflects the number of elements in an array.
  * indexOf() Returns the first (least) index of an element within the array equal to the specified value, or -1 if none is found.
  * join()  Joins all elements of an array into a string.
  * map(item, index) Creates a new array with the results of calling a provided function on every element in this array.
  * pop() Removes the last element from an array and returns that element.
  * push()  Adds one or more elements to the end of an array and returns the new length of the array.
  * reverse() Reverses the order of the elements of an array -- the first becomes the last, and the last becomes the first.
  * shift() Removes the first element from an array and returns that element.
  * slice() Extracts a section of an array and returns a new array.
  * unshift() Adds one or more elements to the front of an array and returns the new length of the array.


## Strings

Methods and properties

  * length  Returns the length of the string.
  * charAt()  Returns the character at the specified index.
  * indexOf() Returns the index within the calling String object of the first occurrence of the specified value, or -1 if not found.
  * split() Splits a String object into an array of strings by separating the string into substrings.
  * substr()  Returns the characters in a string beginning at the specified location through the specified number of characters.
  * substring() Returns the characters in a string between two indexes into the string.
  * toLowerCase() Returns the calling string value converted to lower case.
  * toUpperCase() Returns the calling string value converted to uppercase.


## Dates

```
  new Date( )
  new Date(milliseconds)
  new Date(datestring)
  new Date(year,month,date[,hour,minute,second,millisecond ])
``` 


## Get Info, Show Info

```
  alert("such JavaScript");
  value = prompt("How old are you");
  confirm("bon ?");
```


## Object literals

Ruby had hashes. JS doesn't have hashes. 

JS has objects. You've already used them:

  - JSON == JavaScript Object Notation.
  
```
  var foo = {name: 'Alex', age: 21 };
```
  
This looks a bit like a (Ruby) hash, doesn't it? 

JS objects are a collection of name/value pairs. But those values are frequently functions. 

We don't have to create classes before we create objects... we can create object literals.

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

In our JS objects, the 'keys' are referred to as 'properties' - because they're not key:value pairs (hashes), they're 'objects'.

But we can create functions that return objects... (and the convention for functions that return object is the name them CapitalCamelCase )

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


[i]: It's the student's turn to practice. Run though one or more of the lab exercises.


[1]: http://en.wikipedia.org/wiki/ECMAScript

[2]: http://code.tutsplus.com/tutorials/quick-tip-javascript-hoisting-explained--net-15092 - other resources exist that explain variable hoisting





