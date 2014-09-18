# Debugging

This is going to be useful all the way through the course - it's not that difficult but very powerful and will help save you time.

question:

Who sat down for their homework - started typing. Didn't stop, ran their code and it all worked perfectly?

(no-one, probably)

What sort of errors did you get?  

  - syntax errors and structural
  - undefinied method or local variable
  - could not convert string into fixednum

After you got the program running did it give you the right answer?

(Some people may have had 'working code' - ie. it didn't crash - but not the correct answers)

Debugging is the process of working through those errors and removing 'bugs' from the system.


# Debugging methods

What opportunities and methods do we have of debugging?

  - Guesswork (intuition?!)
  - Process of elimination
  - Testing (manual and automatic) (irb)
  - Console output
  - Rubber duck
  - Breakpoint... someone has built a tool to help us out.

"Pry" is a debugging tool that allows us to add 'breakpoints' into our code and inspect it while it's running.

http://pryrepl.org/
https://github.com/deivid-rodriguez/pry-byebug

```
  gem install pry pry-byebug
```

After you've installed the gem, you may need to rehash:

`rbenv rehash` 

Pry is also a direct replacement for "irb". Let's give it a try:

`pry`

```
  2 + 2
  => 4
```  

Pry makes output a bit prettier than "irb", by using colour, and by laying things out better.

One of pry's best features is its ability to freeze the execution of a file of ruby commands, letting you take a peek inside the running program.

One way of understanding how the new code works is to step through it one line at a time.

First of all, we have to "require" a gem somewhere in our code in order to use it in our program.

```
  require 'pry-byebug'
```  

Now we can put a `binding.pry` call in our code; it is our breakpoint. Our code will stop here when we run it, allowing us to interrogate the current value of variables, and step through the rest of the code one line at a time in the console.

To view all the variables available to you, Pry behaves a little like the shell- and it gives you commands that should sound familiar:

```
  ls
```

This shows all our local variables. We didn't necessarily define them all, some were created automatically, like `\_file\_`.

To see a list of all the local variables (we created) add a `-l`  flag (for local).

```
  ls -l
```

We can step through our code by typing  `step`  or just  `s`. This moves us to the next line, and redraws the code snippet.

*NOTE*: if your terminal window is too small for the snippet to display entirely, you can scroll. You will need to press "q" to exit from this scrolling.

To continue running the program without debugging, we can type `continue`, or just  `c`.

###Other tips

We can prevent pry from going into methods by using `next` rather than `step`. The methods will still get executed, but the debugger doesn't enter it.

While going through your code step by step, you might tunnel down into the code of a gem that's embedded in your program. If you want out, type `finish` (or `f`), you'll exit the gem's code and get back to yours.

If you got lost and cannot remember where you are in your program, `whereami` will draw the code snippet again.

"Pry" and "pry-byebug" have a lot more features (especially pry) than we've covered in class today. 

Check out [github/pry](https://github.com/pry/pry) for additional information.


