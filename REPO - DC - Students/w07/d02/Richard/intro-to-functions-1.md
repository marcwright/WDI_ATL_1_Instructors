# JavaScript Functions

**Learning Objectives (morning)**

- What are first-class functions?
- What is the `arguments` object?
- What is scope & closure? What's the difference?
- What is global scope? Why is it bad?
- What is hoisting?

Like everything in JavaScript, functions are *objects*. This is a major difference from a language such as Ruby, where methods are simply blocks of code with no data type.

## First-Class Functions

In computer science, a programming language is said to have first-class functions if it treats functions as *first-class citizens*. Specifically, this means that the language supports:

 * Assigning functions to variables.
 * Storing functions within data structures.
 * Passing functions as arguments to other functions.
 * Returning functions as the value from other functions.

JavaScript has first-class functions. Wicked Cool.


# 1. The Sunlight Zone

## Named and Anonymous Functions

Functions may have names by which they're referenced, or may be anonymous (ie: unnamed).

```
function goBoom() {
	// This is a named function...
}

function() {
	// This is an anonymous function...
}
```

Typical uses:

 * **Named functions** are commonly used as constructors and/or helpers.

 * **Anonymous functions** are frequently stored as object methods and/or passed around as application data.

## Arguments & Return

Like Ruby methods, JavaScript functions accept passed arguments. Unlike Ruby methods, JavaScript functions require an *explicit return*. This means you MUST include a `return` statement if you want a function to return a value.

```
function add(a, b) {
	return a + b;
}

var result = add(10, 15);

console.log(result);
// >> 25
```

Unlike Ruby, block arguments do NOT support default values. You'll need to resolve default values at the top of your function. Use the "or" operator (`||`) to select between a missing argument or a default value.

```
function add(a, b) {
	a = a || 0;
	b = b || 0;
	return a + b;
}

add(10);
// >> 10
```

### The `arguments` Object

Whenever a function is invoked, its scope is configured with a special array-like object called `arguments`. This arguments object contains all parameters that were passed into the function.

```
function printName(first, last) {
	console.log(arguments[0]);
	console.log(arguments[1]);
}

printName('Beep', 'Beeperson');
// >> "Beep"
// >> "Beeperson"
```

The arguments object is available even if the function block defines no arguments. This provides the foundation for many advanced scenarios (we'll see one later).

```
function printName() {
	console.log(arguments[0]);
	console.log(arguments[1]);
}

printName('Beep', 'Beeperson');
// >> "Beep"
// >> "Beeperson"
```

The oddity of the `arguments` object is that it is literally an Object, NOT an Array… even though it has numeric keys and a `length` property. If you ever want to convert the arguments object into an *actual* array, use this black magic trick:

```
var args = Array.prototype.slice.call(arguments);
```

## Scope & Closure

Every function is a *closure* in which a new *scope* is created.

- A **closure** is a blackbox that encapsulates its internal workings.

- A **scope** is an encapsulated space where data (variables and functions) exist.

**Quote Crockford:**

> JavaScript has function scope. … That means that the variables defined in a function are not visible outside of the function, and that a variable defined anywhere within a function is visible everywhere within the function.

Functions may be nested to create nested scopes. Any scope may look outward to access data from a higher scope, however scopes may not look inward at the internal workings of a closure.

```
var president = "Everyone knows me. Globally!";

function town() {
	var mayor = "I'm unknown outside of my township.";

	function house() {
		var homebody = "No one knows me. I don't leave home.";
	}
}
```

All scripts operate within *global scope*, which is the top-level scope of the JavaScript environment. In web browsers, global scope is the `window` object.

### Variable Scoping

When variables are declared (using the `"var"` keyword), they are created within their immediate scope. If a variable with the same name exists within an outer scope, that variable will be overridden *in the inner scope*. The outer scope variable will remain unchanged.

```
var n = 5;

function inner() {
	var n = 10;
	console.log(n); // << 10
}

inner();
console.log(n); // << 5
```

When a variable is modified in an inner scope without an explicit declaration (`"var"`), that variable will be referenced from up the scope chain:

```
var n = 5;

function inner() {
	n = 10;
}

inner();
console.log(n); // << 10
```

Variables without any declaration in any scope will be treated as global variables, and will be set in global scope.

```
function inner() {
	n = 10;
}

inner();
console.log(window.n); // << 10
```

### IIFE's

To avoid naming conflicts, we want to minimize our footprint of data stored within global scope. **Immedaitely-Invoking Function Expressions** (IIFE) are commonly used to establish a private scope for an application to run in:

```
(function() {
	// My application code goes in here… in my own private scope!
})();
```

## Declaration vs. Assignment

Look at the two scenarios below. While they may appear to be functionally identical, they will actually be subject to different language rules that could affect their behavior.

**Declaration – a named function *declaraction*:**

```
function goBoom() {
	console.log("boom");
}
```

**Assignment – an anonymous function *assigned* to a variable:**

```
var goBoom = function() {
	console.log("boom");
};
```

What's the difference? Declarations may be called upon *anywhere within their scope*, whereas assignments are only available *after they've been set*. As a general rule, use declaractions unless you specifically need to manage assignment order.

## Hoisting

Here's the technical rationale behind declarations versus assignment… When a new scope is configured, all declarations are *hoisted* to the top of the scope. Assignment order is not changed.

Consider the following:

```
// Our hand-written code:

(function() {
	beep(); // << "beep"
	bop(); // << "TypeError: undefined is not a function"

	function beep() {
		console.log("beep");
	}

	var bop = function() {
		console.log("bop");
	};
})();
```

If we run this example, the `beep` function successfully runs while the `bop` function throws an error. Why?

Behind the scenes, the JavaScript compiler has hoisted our declarations, while leaving all original assignment order unchanged:

```
// JavaScript's compiled version of our code:

(function() {
	// Hoisting!
	var bop;
	function beep() {
		console.log("beep");
	}

	beep(); // << "beep"
	bop(); // << "TypeError: undefined is not a function"

	bop = function() {
		console.log("bop");
	};
})();
```
