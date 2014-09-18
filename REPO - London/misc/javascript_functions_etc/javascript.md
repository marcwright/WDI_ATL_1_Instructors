# JS Overview

  JavaScript (JS) is an interpreted computer programming language.

  Originally implemented as part of web browsers so that client-side scripts could interact with the user, control the browser, communicate asynchronously, and alter the document content that was displayed.


  - reacts to events
    overview/1.html

  - manipulate the HTML document in the browser

    - changing the HTML content of elements
      overview/2.html

    - or their attributes (like source of an image tag)
      overview/3.html

    - changing parts of an attribute, like the style of an HTML element
      overview/4.html

    - JavaScript is commonly used to validate input
      overview/5.html

  - JavaScripts in HTML must be inserted between <script> and </script> tags.
  
  - You can see some of the things we've used here:
    - events - onclick
    - functions
    - if...else...

  - all the other functionality you might expect from Ruby:
    - case statements
    - loops

  - how would we find them? GOOGLE! 


  - We can use the console in the browser to enter JS commands
    - but it's not quite *exactly* the same as IRB

    4 * 77

    4 * '77'

    - and it's not quite the same as Ruby
    '4' * 77

    'four' * 77
    => NaN

  - ways of interacting with user/browser
    alert('hello');
    prompt('say something...');
    console.log('log this for me');

  - we can write functions in the console (like we did in IRB)
    function square(number) { var square = number * number;return square;}

    square(12);

    square(prompt('enter number to square'));

  - but it's a bit of a faff... so let's start working in a file.
    - note: all our functions are going to be in the global namespace... bad, just like in Ruby; but just like we started Ruby like this, we're starting JS the same...

    <!DOCTYPE html>
    <html>

    <head>
    </head>

    <body>
      <h1>Calculator</h1>


      <script>

      </script>
    </body>
    </html>


  - Calculator in JS
    function square(number) {
      var square = number * number;
      return square;
    }
    // we *have* to return in JS... Ruby returns by default

  - we can DRY this with:
    function square(number) {
      return (number * number);
    }

    function cube(number) {
      return (square(number) * number);
    }

    function area(length, width) {
      return (length * width);
    }


    function get_number(message)
    {
      return parseInt(prompt(message));
    }

    var response = prompt('(s)quare, (c)ube, (a)rea or (q)uit: ');

    while(response != 'q')
    {
      switch(response)
      {
        case 's':
          var squared = square(get_number('enter number to square: '));
          alert('the square is : ' + squared);
          break;
        case 'c':
          var cubed = cube(get_number('enter number to cube: '));
          alert('the cube is : ' + cubed);
          break;
        case 'a':
          var length = get_number('enter length: ');
          var width = get_number('enter width: ');
          alert('the area is : ' + area(length, width));
          break;
      }
      response = prompt('(s)quare, (c)ube, (a)rea or (q)uit: ');
    }




