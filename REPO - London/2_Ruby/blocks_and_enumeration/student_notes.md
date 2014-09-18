# Blocks & Enumeration

We have already touched on blocks, if we've seen code like:

  `10.times { |i| print i, " " }`

A block is a portion of code that is passed to a method - in fact, blocks can be considered little methods of their own, just with no name
  
Used very often with "enumerable" objects (Arrays, Hashes) to run the block against each element in the collection.

For this lesson we will use some of the enumerable methods to demonstrate blocks. You will use these methods *all the time* in your Ruby programming career, so become very familar with them.

- Demonstrate googling for "ruby api array", "ruby api enumerable" - reinforce how importand it is to remember to do this, and to read this 

```  
  def print_name(name)
    print name, " "
  end

  names = %w(Fred Wilma Barney) 

  for i in 0..names.size
    print_name(names[i])
  end
```

  or...
  
```
  %w(Fred Wilma Barney).each { |name| print_name(name) }
```

  or ...
  
```
  %w(Fred Wilma Barney).each do |name| 
    print_name(name)
  end
```

  - We generally use {} for one-line blocks, and "do..end" for multiline blocks


## Let's play with blocks:
  
```
    %w(Fred Wilma Barney).map { |name| name.reverse }
  
    %w(Fred Wilma Barney).each { |name| puts name*3 }
  
    (1..100).each { |i| puts i if i % 7 == 0 }    

    %w(Fred Wilma Barney).each_with_index { |name, index| puts "#{name} is #{index.odd? ? "boys'" : "girls'"} name"}
      
    (1..10).each_slice(3) { |a| puts a }    
  
    (1..3).cycle(3) { |i| puts i }    
  
    (1..10).select { |i| i.even? }    
  
    (1..10).detect { |i| i.even? }    
  
    (1..10).group_by { |i| i%3 }    

    # Hashes are enumerable too
    {name: 'michael', age: 40, location: 'Back Hill'}.each_pair do |k, v|
      puts "key '#{k}' has the value '#{v}'"
    end
  
    "The quick brown fox jumped over the lazy dog".split.each do |word|
      if word.length.even?
        puts word.downcase
      else
        puts word.upcase
      end
    end
```

## The previous method refactored

```
  "The quick brown fox jumped over the lazy dog".split.each do |word|
    puts (if word.length.even?
      word.downcase
    else
      word.upcase
    end)
  end
  
  "The quick brown fox jumped over the lazy dog".split.each do |word|
    puts word.__send__(word.length.even? ? :downcase : :upcase)
  end
```

- Double-reinforce the API references:
  [Hash](http://www.ruby-doc.org/core-2.1.2/Hash.html)
  [Array](http://www.ruby-doc.org/core-2.1.2/Array.html)
  [Enumerable](http://www.ruby-doc.org/core-2.1.2/Enumerable.html)

