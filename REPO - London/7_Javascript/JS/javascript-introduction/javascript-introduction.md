# Javascript Introduction wdi april

## Short history of javascript 

JavaScript, not to be confused with Java, was created in 10 days in May 1995 by Brendan Eich, then working at Netscape and now of Mozilla.  In 1996 - 1997 JavaScript was taken to ECMA to carve out a standard specification, which other browser vendors could then implement based on the work done at Netscape. First, Brendan Eich and Mozilla in 2005 rejoined Ecma as a not-for-profit member. In 2005 when Jesse James Garrett released a white paper in which he coined the term Ajax, of which JavaScript was the backbone, used to create web applications where data can be loaded in the background, avoiding the need for full page reloads and resulting in more dynamic applications. This resulted in a renaissance period of JavaScript usage spearheaded by open source libraries and the communities that formed around them, with libraries such as Prototype, jQuery, Dojo and Mootools and others being released. All of this then brings us to today, with JavaScript entering a completely new and exciting cycle of evolution, innovation and standardisation, with new developments such as the Nodejs platform, allowing us to use JavaScript on the server-side, and HTML5 APIs to control user media, open up web sockets for always-on communication, get data on geographical location and device features such as accelerometer, and more. It is an exciting time to learn JavaScript.

## Differences with ruby

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

function reverse(string){
  var result = "";
  for(var i = string.length-1; i >= 0; i--){
    result += string[i];
  }
  return result;
}
```
  
  - Got a new for loop, explain that. 
  - Variables have 'var' before them.
  - But we can still use += to add strings together. 
  - And we can still get access to characters of a string, we can still use `string[i]`. 



### Syntax 

A JavaScript consists of JavaScript statements that are placed within the <script>... </script> HTML tags in a web page.

The ```<script>``` tag alert the browser program to begin interpreting all the text between these tags as a script. So simple syntax of your JavaScript will be as follows



```
<script ...>
  JavaScript code
</script>
```

"Hello World".

```
<html>
<body>
<script language="javascript" type="text/javascript">
<!--
   document.write("Hello World!")
//-->
</script>
</body>
</html>
```

Whitespace and Line Breaks:
JavaScript ignores spaces, tabs, and newlines that appear in JavaScript programs.


Case Sensitivity:
JavaScript is a case-sensitive language. This means that language keywords, variables, function names, and any other identifiers must always be typed with a consistent capitalization of letters.

So identifiers Time, TIme and TIME will have different meanings in JavaScript.
```
time = 1
Time = 2
TIME = 3
time + Time + TIME //6

```

Any text between a // and the end of a line is treated as a comment and is ignored by JavaScript.

Any text between the characters /* and */ is treated as a comment. This may span multiple lines.



### Where to put Javascript

  * Writing Javascript in head
  * Writing Javascript in body
  * Javascript in external file
  * The importance of document.load. document.load will wait until the browser received and parsed all the content of the page, this avoid running code based on some parts of the page while they haven't been loaded yet. 



### Variables

```
var money;
var name;

var money, name;

var name = "Ali";
var money;
money = 2000.50;
```

JavaScript is untyped language. This means that a JavaScript variable can hold a value of any data type.

JavaScript variable names should not start with a numeral (0-9). They must begin with a letter or the underscore character

JavaScript variable names are case sensitive. For example, Name and name are two different variables.



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
```

## Operators


### Arithmetic Operators
```
var a = 10; 
var b = 20;
```
  
  * `+` Adds two operands  A + B will give 30
  * `-` Subtracts second operand from the first  A - B will give -10
  * `*` Multiply both operands   A * B will give 200
  * `/` Divide numerator by denumerator  B / A will give 2
  * `%` Modulus Operator and remainder of after an integer division  B % A will give 0
  * `++`  Increment operator, increases integer value by one   A++ will give 11
  * `--`  Decrement operator, decreases integer value by one   A-- will give 9
  
### Comparision Operators

  * `==` Checks if the value of two operands are equal or not, if yes then condition becomes true.   (A == B) is not true.
  * `!=` Checks if the value of two operands are equal or not, if values are not equal then condition becomes true.  (A != B) is true.
  * `>` Checks if the value of left operand is greater than the value of right operand, if yes then condition becomes true.   (A > B) is not true.
  * `<` Checks if the value of left operand is less than the value of right operand, if yes then condition becomes true.  (A < B) is true.
  * `>=` Checks if the value of left operand is greater than or equal to the value of right operand, if yes then condition becomes true.   (A >= B  * ) is not true.
  * `<=` Checks if the value of left operand is less than or equal to the value of right operand, if yes then condition becomes true.  (A <= B)   * is true.

### Logical (or Relational) Operators

  * `&&` Called Logical AND operator. If both the operands are non zero then then condition becomes true.  (A && B) is true.
  * `||` Called Logical OR Operator. If any of the two operands are non zero then then condition becomes true.  (A || B) is true.
  * `!` Called Logical NOT Operator. Use to reverses the logical state of its operand. If a condition is true then Logical NOT operator will make * false.   !(A && B) is false.


### Assignment Operators
  * `=` Simple assignment operator, Assigns values from right side operands to left side operand   C = A + B will assigne value of A + B into C
  * `+=`  Add AND assignment operator, It adds right operand to the left operand and assign the result to left operand   C += A is equivalent to C  * = C + A
  * `-=`  Subtract AND assignment operator, It subtracts right operand from the left operand and assign the result to left operand   C -= A is  * equivalent to C = C - A


### typeof

typeof is a unary operator placed before its single operand.

values returned:

Type       |  String Returned by typeof

---------------------------------------
Number     |  "number"                 
String     |  "string"                 
Boolean    |  "boolean"                
Object     |  "object"                 
Function   |  "function"               
Undefined  |  "undefined"              
Null       |  "object"                 





## Conditionnals operators


### if

```
if (expression){
   
}
```

### if else
```
if (expression){
   
}
else{
  
}
```

### if else if
```
if (expression){
   
}
else if (expression){
   
}
```

### switch
```
switch (grade)
{
  case 'A': "Good job"; break;
  case 'B': "Pretty good"; break;
  case 'C': "Passed"; break;
  case 'D': "Not so good"; break;
  case 'F': "Failed"; break;
  default:  "Unknown grade"; break;
}
```


### For loop

The for Loop
The for loop is the most compact form of looping and includes the following three important parts:

loop initialization / test statement / iteration statement

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

There is one more loop supported by JavaScript. It is called for...in loop. This loop is used to loop through an object's properties.

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
}while (count < 0);
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
  }
}
```

## Some specificities of javascript

- JS will *coerce* things for you, like duck typing, but it'll not always do what you think it should...

```
"37" - 7 // 30
"37" + 7 // "377"
parseInt("37") + 7 // 44
parseInt(“dfkljsljs12”) ->  12
parseInt(“12.38498239”) ->  12
parseFloat(“12.38498239”) ->  12.38498239
parseInt("foo")// NaN
parseInt("foo") + 7 // NaN


```

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

__Truthiness in javascript is tough, 
  [Javascript equality table](http://dorey.github.io/JavaScript-Equality-Table/)__

### Arrays

```
var fruits = new Array( "apple", "orange", "mango" );
var fruits = [ "apple", "orange", "mango" ];
```

Mehods and properties

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

## String

Methods and properties

  * length  Returns the length of the string.
  * charAt()  Returns the character at the specified index.
  * indexOf() Returns the index within the calling String object of the first occurrence of the specified value, or -1 if not found.
  * split() Splits a String object into an array of strings by separating the string into substrings.
  * substr()  Returns the characters in a string beginning at the specified location through the specified number of characters.
  * substring() Returns the characters in a string between two indexes into the string.
  * toLowerCase() Returns the calling string value converted to lower case.
  * toUpperCase() Returns the calling string value converted to uppercase.

##Date 

```
new Date( )
new Date(milliseconds)
new Date(datestring)
new Date(year,month,date[,hour,minute,second,millisecond ])
``` 


### Get Info, Show Info

```
  alert("much console")
  value = prompt("How old are you")
  confirm("bon ?")
```

### Play Yourself

Create a script that prompts the user for his age, then :

  * If the user is more than 18, he can play.
  * If the user is less than 18, then he can't play and should have a message telling him that he/she's too young.

  * then the game is to guess a color defined in a variable. The user gets prompted while the input is not the color, then when it match , a message tell the user that he won.

```
<html>
<head>
<script>

age = prompt("how old");
if (age>18) {
    alert('you can play');

    color = 'black';
    userColor = prompt("what's the color?");
    while(userColor!=color) {
     userColor = prompt("what's the color?");
    }
    alert('you got it');
} else {
    alert('too young');
}


</script>

</head>
</html>
```

Now we want to store the values the user tried.

There's no "string interpolation" equivalent, so we have to concatenate.
```
<html>
<head>
<script>

age = prompt("how old");
colorValues = [];
if (age>18) {
    alert('you can play');

    color = 'black';
    userColor = prompt("what's the color?");
    while(userColor!=color) {
     colorValues.push(userColor);
     userColor = prompt("guess again! what's the color?");
    }
    alert('you got it in ' + colorValues.length + ' guesses.');
} else {
    alert('too young');
}

</script>


</head>
</html>
```

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

You can change the dom on events
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
You can Get input Value
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
