### Your turn 

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

Further challenges if desired:

- Write a small program that asks a user for a number. If it's a multiple of 3, output 'fizz'. If it's a multiple of 5, output 'buzz'. If it's a multiple of 3 and 5, output 'Fizzbuzz'. 

```
for (i=1; i<=100; i++) {
  output = "";
  if (i % 3 == 0) {
    output += "Fizz";
  }
  if (i % 5 == 0) {
    output += 'Buzz';
  }
  if (output) {
    console.log(output);
  } else {
    console.log(i);
  }

}
```


- A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 * 99. Find the largest palindrome made from the product of two 3-digit numbers.
  - Sounds like you're going to want some kind of loop...
  - Maybe two loops.
  - And a function that determines whether a number is a palindrome or not. 
  - And some part of your code that remembers the largest palindrome it's seen so far. 


```
function reverse(value) {
    return value.split("").reverse().join("");
}

function isPalindrome(value) {
  value = value.toString();
  return value == reverse(value);
}

var highest_palindrome = 0;
var factors = [];

for (i = 100; i < 1000; i++) {
  for (ii = i; ii < 1000; ii++) {
    factor = i * ii;
    if (isPalindrome(factor) && factor > highest_palindrome) {
      highest_palindrome = factor;
      factors = [i, ii];
    }
    
  }
}

highest_palindrome // => 906609
factors // => [913, 993]
```

