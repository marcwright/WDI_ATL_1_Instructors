# Ruby Procs - sometimes Ruby isn't that beautiful (or is it)

Let's play with a couple of ways of solving a problem.

By now we should be appreciating that programming isn't about solving big problems. It's much more about chopping up big problems into little bits, and then solving the little bits.

Our problem today is to work out, given a list of ages, which ones are under 100 years old.

Our first solution might be a little verbose:

```
ages = [23, 101, 7, 104, 11, 94, 100, 121, 101]

puts "manual"
ages.each do |x|
  if x < 100
    puts "#{x} is less than 100"
  end
end
```

But we can streamline it:

```
puts "using `select`"
puts ages.select { |x| x < 100 }
```

And we can use Ruby functionality to extract blocks out to variables (just like JS anonymous functions):

```
puts "proc"
under_100 = Proc.new { |x| x < 100 }
```


# ages.each do |x|
#   if under_100.call(x)
#     puts "#{x} is less than 100"
#   end
# end

```
ages.select { |x| under_100.call(x) }
```

```
puts "proc 2"
puts ages.select(&under_100)
```

# games.map(&:id)

```
puts "wtf?"
puts ages.select(&100.method(:>))
```



See... Ruby can suck too!

