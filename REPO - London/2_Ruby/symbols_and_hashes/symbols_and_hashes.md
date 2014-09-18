#Symbols

Identify what a symbol is and how it is different than a string.

##Discuss: What is a symbol?

Like most other things in Ruby, a symbol is an object.

Symbols are a special type of String, used most often in Ruby to represent names of things – they give a human-readable place in code, but are efficient for the computer too.

They are generated using the "colon-name" (:name) and "colon-string" (:"name") syntax, and by intern and to_sym methods. You will most often see them written in code with the "colon-name" style.

The largest important difference to Strings is that Symbols are immutable. Mutable objects can be changed after assignment while immutable objects cannot.
eg.

    string = "hello" # assiging a value to a string
    # => "hello"
    string << " world" # appending another value to the string
    # => "hello world"

Being mutable, Strings can have their share of issues in terms of creating unexpected results and reduced performance. It is for this reason Ruby also offers programmers the choice of Symbols.
eg.

    symbol = :hello # assiging a value to a symbol
    # => :hello
    symbol << " world" # appending another value to the symbol
    # => NoMethodError: undefined method '<<' for :hello:Symbol

After the first use of a Symbol all further useages of it take no extra memory – they're all the same object. This can save memory over large numbers of identical literal strings, and enhance runtime speed – at least to some degree.

Symbols don't offer the large set of methods that Strings do (like, ".upcase", ".reverse", ".prepend", etc); all the things you can do to Stings, you can't do to Symbols – but it's because of this they are more prefered for using in some cases. Since once they're set, they can never change – they can't accidentally change, which is a small protection against bugs.
But if you need a Symbol to behave like a String, then you can generate a String from it with the ".to_s" method.

## Demonstrate: How to create and manipulate symbols using pry

We can best illustrate them by trying them in the console:

First we will try three Strings:

    puts "hello".object_id
    # => 3102163
    puts "hello".object_id
    # => 3098211
    puts "hello".object_id
    # => 3093564

Then we'll try three Symbols:

    puts :"hello".object_id
    # => 234518
    puts :"hello".object_id
    # => 234518
    puts :"hello".object_id
    # => 234518

As you see, the object IDs for the Symbols are the same, while the Strings are all different – the Strings are three different instances, while the Symbols are all pointing to the same single instance.
And it doesn't matter how the Symbol is instanciated:

    puts :hello.object_id
    # => 234518
    puts "hello".intern.object_id
    # => 234518
    hello_variable = "hello"; puts :"#{hello_variable}".to_sym.object_id
    # => 234518

Look at the amount of instance methods of String (c.110) compared to Symbol (c.25). How many of Symbol's are 'bang' methods? (ask)

## Discuss: Why use Symbol vs a String?

So what are the benefits of using Symbols: (ask)

- Immutability
- Performance
- Legibility of 'names of things' (important when you're reading lots of code)
- Simplicity

And did you pick up on any downsides of using them? (ask)

- Not so many methods
- Not as versitile

One of the main places you will use Symbols in Ruby is as 'keys' in Hashes. Earlier we covered the use of Arrays as a way of collecting objects into a container, but now we're going to explore a little about these other type of collection.

Any questions about Symbols?


# Hashes

Identify what a hash is and why you would use it instead of an array.


##Discuss: What is a hash?

A Hash is a dictionary-like collection of unique keys and associated values. This is why they're also referred to as Associative Arrays, or Key-Value Pair Collections. They are similar to Arrays, but there are important, useful differences.

Can you remind me of some of the features of Arrays? (ask)

- Collections of objects
- Enumerable
- Ordered
- Indexed by integer
- One object per element

Hashes share some of these features with Arrays: They are Enumerable, they collect objects together, but where Array uses integers as its index, a Hash allows you to use any object as a key; though generally – more than nine-times-out-of-ten – for most simplicity, Symbols are most often used as Hash keys.

However, a Hash is unlike an Array in that its elements are not stored in any particular order (well... they never used to be, but since Ruby 1.9 they are, but in other languages they're still not... I find it best to assume they're not, and not to rely on them being ordered), and they are retrieved with the "key" instead of by their position in the collection.

##Discuss: Why use a hash vs array?

Hashes are best used where you want to know a little more than just its value of the element you're storing in the collection. For instance, if you had a class of students, and you wanted to do some calculations on their grades from a test, an Array would let you save each of their scores in seperate elements, but a Hash would allow you to store each student's name as the key for the score value too.



##Can you suggest any other uses for Hashes? (ask)

- Configuration options
- Method parameters



##Demonstrate: Create a Hash

The concept of Hashes can be a little abstract, so it's best to play with them in a console to see the effect.



We can create hashes by instanciating a new Hash object:

    hash = Hash.new
    # => {}

As you see, Ruby represents Hashes with curly-braces (just as an array was a pair of square-braces), and we can shortcut their creation that way:

    hash = {}
    # => {}


We can also create "Hash Literals"; that is, Hashes that are pre-populated with key-value pairs:

    hash = {:top => 5, :right => 6, :bottom => 10, :left => 10}
    # => {:top => 5, :right => 6, :bottom => 10, :left => 10}

(The '=>' sign is sometimes referred to as a 'hash rocket' or – a little uncaring – a 'fat arrow', and is used to indicate the association of a key and its value)



And if all the keys of my Hash are Symbols, then I can use this syntax:

    hash = {top: 5, right: 6, bottom: 10, left: 10}
    # => {:top => 5, :right => 6, :bottom => 10, :left => 10}

(just like the way we assigned values in CSS and JavaScript :-)



##Demonstrate: Access items in a hash (vs. an array)

In an array, we access elements by their index:

    array = [:top, :right, :bottom, :left]
    # => [:top, :right, :bottom, :left]
    array[1]
    # => :right
    array.last
    # => :left
    array[-1]
    # => :left
    array[6]
    # => nil

In a Hash, which is not indexed by position, but by key, we use the key to access elements;

    hash = {top: 5, right: 6, bottom: 10, left: 10}
    # => {:top => 5, :right => 6, :bottom => 10, :left => 10}
    hash[:top]
    # => 5
    hash[:left]
    # => 10

There's a method called 'fetch' on Hash, which is frequently preferred: 

    hash.fetch(:left)
    # => 10

Requests for keys which don't exist return nil:

    hash[:center]
    # => nil

.fetch will raise an exception:

    hash.fetch(:center)
    # => KeyError: key not found: :center

or perform some other action:

    hash.fetch(:center, 0)
    # => 0

    hash.fetch(:center) { [0,1].sample }
    # => ????


We can add and replace items in the Hash by writing to their key:

    hash[:center] = 55
    # => 55
    hash[:top] = 100
    # => 100
    hash
    # => {:top => 100, :right => 6, :bottom => 10, :left => 10, :center => 55}

But once it's set, there will always be an entry for a key unless we tell the Hash to delete it

    hash[:center] = nil
    # => nil
    hash
    # => {:top => 100, :right => 6, :bottom => 10, :left => 10, :center => nil}
    # (remember, even 'nil' is an object)
    hash.delete(:center)
    # => nil
    hash
    # => {:top => 100, :right => 6, :bottom => 10, :left => 10}

Any questions about Hashes?


##In Summary


Symbols are like strings, and often used in place of them – but are always the same instance.

Hashes are associative arrays – you may not be able to rely on their order, but they're indexed by their key, which makes them great for storing extra information (meta-data) about their contents.

##Extras

###Symbol tricks and gotchas

###Hash tricks and gotchas


Instanciate with an even number of parameters:
Hash[:color, :red, :padding, 11]
# => {:color => :red, :padding => 11)

or with the Array splat operator:
options = [:color, :red, :padding, 11]
Hash[*options]
# => {:color => :red, :padding => 11)

Rails has a Hash-construct called “HashWithIndifferentAccess”, which allows you to access the elements with either a Symbol or a String.
