#Value vs. Reference

##Objects in JavaScript
An object is a container of properties, where a property has a name and a value. A property name can be any string, including the empty string. A property value can be any JavaScript value except for undefined.

The simple types of JavaScript are numbers, strings, booleans, null, and undefined.
All other values are objects.

Numbers, strings, and booleans are object-like in that they have methods, but they are immutable.
Objects in JavaScript are mutable keyed collections.
In JavaScript, arrays are objects, functions are objects, regular expressions are objects. Objects are objects, too.

Objects in JavaScript are class-free. Objects are useful for collecting and organizing data.

##Let's play
To get to the topic of "value vs. reference", let's create some objects and play with it.

    var empty_object = {}; // this is an empty object
    
    var his_airness = {
        "first-name": "Michael",
        "last-name": "Jordan",
        "number": 42
    };
    
    // let's re-assign the #23 to His Airness by doing
    his_airness['number'] = 23;

An important thing about objects in JavaScript is the fact that they are passed around by reference (not by value), meaning they are never copied.

    var x = his_airness;
    x.nickname = "His Airness";
    
    // now check if his_airness has the property 'nickname' as well
    his_airness.nickname; // should return "His Airness"
    
##Why you should care
At some point, you will compare objects like arrays in JavaScript. Arrays in JavaScript are objects and therefore are passed by reference.

One of many approaches in the game logic of Tic Tac Toe is what some people call pattern matching. So at some point you'll run into comparing two arrays. And if not, get your mind blown right now:

    [1, 2, 3] == [1, 2, 3]; // returns false
    
Wait! What?!

My thoughts exactly. Arrays are objects and we create two arrays when we compare the arrays. The contents of the array might be the same, but the arrays as a whole are two different objects and thus we get a *false* in JavaScript, when we compare two arrays who look alike.

So in order to compare the contents of two arrays, you might want to turn these arrays into a string - which is not an object in JavaScript and therefore gets passed by value (and not by reference).

    [1,2,3].toString() == [1,2,3].toString(); // returns true