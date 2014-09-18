# Strings, Conditionals, Loops

## String Concatention

We can join strings together by using the `+` method, the same as adding integers:

```
  "hello" + "world"
  "hello" + " " + "world"
  h = "hello"
  w = "world"
  space = " "
  h + space + w
```

But Ruby favours 'string interpolation', where variables are put inside string rather than added together:

```
  h = "world"
  "hello #{h}"
  "hello #{1}" # automatically casts to_s
```


## Conditional Logic

We sometimes need to evaluate portions of code based on the truthiness or not of a statement. This is conditional logic:

```
  if true then "hello" else "bye" end
  unless true then "hello" else "bye" end
```

Aside: we don't normally see these conditionals on one line (it's hard to read...); instead it's normally:

```
  if true 
    "hello" 
  else
    "bye" 
  end
```

But we can also add a single conditional statement to the end of lines of code, as a 'guard':

```
  "hello" if true
  "hello" if false
```

'If' statements work very well for two conditions, with multiple conditions, we can use 'case' statements:

```
  score = 6
  case score
    when 10
      "genius"
    when 8..9
      "merit"
    when 5..7
      "pass"
    else # default value is optional... without this it would return nil
      "fail"
  end
```

We're reaching the limits of what we want to type in the console, we need to write bigger programs, so we'll need to start working with Ruby files, and executing them in the terminal.

```
  subl what-name.rb
```

```
  puts "What is your name?"
  name = gets
  puts "Hiya, #{name}"
```

```
  ruby what-name.rb
```

```
  subl case_statement.rb
```

Paste the code from the case statement above (but need to 'puts' the output)
  
```
  ruby case_statement.rb
```


## Loops

When we need to do the same thing again and again, we loop.

In Ruby we can use `for, while, until, loop`

```
  for i in 1..10; print i, " "; end
  x=0; until x==10; puts x+=1; end
```

What happens if the condition is never met?... The code will loop forever, or crash.

`x=0; until x==10; puts x-=1; end # ctrl-c to exit ;-)`

So beware of infinite loops (and stack overflows)


### Playing with loops

Let's write a program that asks a user to guess the answer to a maths question, and loops until they get it right:

```
  subl loop.rb
```

```
  puts "what is 2 to the 4th power?"
  value = gets.chomp.to_i

  while value != 2**4
    print "nope... try again"
    value = gets.chomp.to_i
  end

  puts "yes!"
```


### Exiting out of loops

To exit out of loops, and when loops crash, we have some other functionality available to us:

  - break:
    Terminates the most internal loop. Terminates a method with an associated block if called within the block (with the method returning nil).
  - next:
    Jumps to next iteration of the most internal loop. Terminates execution of a block if called within a block (with yield or call returning nil).
  - redo:
    Restarts this iteration of the most internal loop, without checking loop condition. Restarts yield or call if called within a block.
  - retry:
    If retry appears in the iterator, the block, or the body of the for expression, restarts the invocation of the iterator call. Arguments to the iterator is re-evaluated.

So for instance, if we want to loop asking the user for input for ever, *until* they type a particular character ('q'), we could use:

```
  loop do
    print "type something: "
    line = gets.chomp
    break if line =~ /q|Q/
    puts line
  end
```


## More idiomatic Ruby

Loops are a very common programming device, and Ruby support them, but when we get further into Ruby programming, we will use them less, in favour of more idiomatic Ruby constructs. For example:

```
  10.times { |i| print i, " " }
  1.upto(10) { |i| print i, " " }
```

The curly brackets are a special syntax of "blocks" - which we'll cover them later, but they're a bit easier on the eye than loops, and maybe, more useful and more flexible.
