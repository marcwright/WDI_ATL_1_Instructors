## JavaScript

### Concepts
- Explain what a "primitive" is and describe the different data types in Javascript
- Identify the difference between `==` and `===` in JavaScript and when to use each
- Explain `var` and its effect on scope in JavaScript
- Explain the difference between calling and referencing a function in JavaScript.

### Mechanics
- Follow a JavaScript style guide and use the appropriate syntax
- Define a function in JavaScript
- Create an array, access items in an array, change the value of items in an array
- Use a for loop for iteration
- Create objects using literal notation
- Access property values in a JavaScript object

---

### Blog HW...?

### Framing
  - Week framing page
  - Start with the basics of the language. Translate from Ruby today.
  - Tomorrow will be weirder stuff and functional programming paradigm.
  - Asynchronous nature.
  - DOM Stuff later this week.


### Why JavaScript?
  - History
    - JavaScript was originally developed by Brendan Eich in 10 days, while working for Netscape. Make developing more accessible.
    - LiveScript --> JavaScript
  - [Most popular language on GitHub](https://github.com/languages)
  - The only language built-in to every web browser
  - Also used on the server side (Node.js)

---

### Basics

- CMD + Shift + j for console

##### Primary Data Types (require less memory)
- typeof()
- String
  - concat
- Number
  - One number type, no separate float and integer
  - +, -, *, /, %
  - parseInt()
  - NaN
- Boolean & if
  - true, false
  - 1 > 2, 1 < 2
  - '', 0
  - == v ===

  ```
  '' == '0'           // false
  0 == ''             // true
  0 == '0'            // true

  false == 'false'    // false
  false == '0'        // true

  false == undefined  // false
  false == null       // false
  null == undefined   // true
  ```
- Undefined
  - undefined means a variable has been declared but has not yet been assigned a value
  - var beep;
NULL
  - null is an assignment value. It can be assigned to a variable as a representation of no value
  - var beep = null;

##### Composite (Reference) Data Types. Will come back to this later.
- Object
- Array

##### Variables
- Variable initialization can be separate from assignment
- always use `var`!
- Objects are pass by reference, primitives are pass by value
  - do for numbers and strings:
  ```
  a = 5
  b = a
  a = 6
  b
  ```

---

##### Compare JavaScript vs. Ruby syntax of:
  - I/O: prompt, console.log, alert
  - comments: //, /* */
  - if/else
  - switch/case/default/break vs. case/when/else
  - while

##### MDN Docs

##### AC & Guess the number

---

##### Compare JavaScript vs. Ruby syntax of:
  - functions
  - explicit return
  - use camelCase (vs. snake_case)
  - arrays

##### this for that & favorite things

---

##### Compare JavaScript vs. Ruby syntax of:
  - objects

##### person object
##### currency converter

---

##### underscore

---

##### mta

##### Read Eloquent JavaScript chapters 1 - 4