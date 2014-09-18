// this is a comment

/*
  this is a
  block comment
*/

// variable assignment
var variable = "value";
console.log(variable);

// conditionals
var number = 10;
if (number > 5) {
  console.log("It's greater than 5.");
} else if (number < 5) {
  console.log("It's less than 5.");
} else {
  console.log("It's equal to 5.");
}

// switch statement
var day = "Saturday";
switch (day) {
  case "Monday":
    console.log("The workweek is starting.");
    break;
  case "Wednesday":
    console.log("Halfway through the workweek.");
    break;
  case "Friday":
    console.log("The workweek is almost over.");
    break;
  case "Saturday":
  case "Sunday":
    console.log("It's the weekend!");
    break;
  default:
    console.log("Keep on trucking.");
}

// while loop
var count = 10;
while (count > 0)  {
  console.log(count);
  count--;
}

// function
function add( one_num, another_num ) {
  return one_num + another_num;
}
var sum = add(2, 2);
console.log( sum );

// anonymous function
var add = function( one_num, another_num ) {
  return one_num + another_num;
};
var sum = add(2, 2);
console.log( sum );

// array
var dwarves = ["Bashful", "Doc", "Dopey", "Grumpy", "Happy", "Sleepy", "Sneezy"];

// for loop
var greeting;
for (var i = 0; i < dwarves.length; i++) {
  greeting = "Hi, I am " + dwarves[i] + ".";
  console.log( greeting );
}

var greeting;
dwarves.forEach( function( dwarf, index ) {
  greeting = "I am dwarf #" + index + ", " + dwarf + ".";
  console.log( greeting );
});

// object (literal notation)
var myBird = {
  name: "Tweety",
  chirp: function() {
    return "Tweet, Tweet, Tweet!";
  },
  greet: function() {
    return "Hi, my name is " + this.name + ".";
  }
};