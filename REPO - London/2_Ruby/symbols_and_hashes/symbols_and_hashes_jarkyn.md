
#Hashes


##Hash definition

A Hash is a dictionary-like collection of unique keys and associated values. This is why they're also referred to as Associative Arrays, or Key-Value Pair Collections. They are similar to Arrays, but there are important, useful differences:
- Hash lets you use anything as keys, not just numbers.
- While array is an ordered collection, we cannot rely on the order of key-value pairs in the hash


##Hash syntax

inside irb:

  __student = {'name' => 'Lawrence', 'age' => 18, 'height' => 6*12+2}__

Here student variable is declared and hash is being assigned to it.   
We are using curly braces, to start and end hash, elements of a hash are comma separated, and for each of the element you need to provide the index or KEY and the VALUE, you also need a "hashrocket". 
Hash is referred to as associative array because it associates one thing to another, key to the value. 


##Declaring a hash


1. literal declaration:
  
    __my_hash = {"key" => "value"}__

2. Constructor method:

    __my_hash = Hash.new__


##Accessing data in a hash

We use the same principle to get data out of a hash as we do with arrays, ie using the index inside the square brackets. Instead of just ordered numbers in hashes we're using keys to say what we want from the _student_ hash:

```
  >> student['name']
  => Lawrence
  
  >> student['age']
  => 18
  
  >> student['height']
  => 74
```


##Adding data to Hash:

similar to how we do it for arrays, we specify a new key and assign the value to that like so:

```
  >> student['city'] = "London"
  =>"London"
  
  >> student['city']
  => London 
  
  >> student
  => {"name" => "Lawrence", "age" => 18, "height" => 74, "city" => "London"}
```

Keys don't have to be strings though, we can also do this:

```
  >> student[1] = "Wow"
  => "Wow"
  
  >> student[2] = "Hola"
  => "Hola"
  
  >> student[1]
  => nil
  
  >> student[2]
  => Hola 
  
  >> student
  => {1=>"Wow", "name"=>"Lawrence", 2=>"Hola", "city"=>"London",     "height"=>74, "age"=>18}
```

##Deleting from Hash

Here's how you delete things, with the delete function:

```
  >> student.delete('city')
  => "London"
  
  >> student.delete(1)
  => "Wow"
  
  >> student.delete(2)
  => "Hola"
  
  >> student
  => {"name"=>"Lawrence", "height"=>74, "age"=>18}
```

##Accessing non existent key

```
  >> student["marks"]
  => nil
```

so accessing any key that does not exist will return a nill value


##Default value

If you recall the constructor method to declare a hash: Hash.new
One of the advantages of the constructor method is that you can set a default value to all keys at a point of declaration.

this is how it looks:

```
  >> course_producers = Hash.new("Julien")
  => {}
  
  >> courses_producers
  => {}
  
  >> course_producers["UX"] = "Laura"
  => "Laura"
  
  >> course_producers
  => {"UX"=>"Laura"}
```

so if we now try to access key, which doesn't yet exist a default value is returned:

```
  >> course_producers["WDI"]
  => "Julien"
```  


##Arrays in a hash, Hash inside hash




so far we have looked at simple data types like strings and numbers for keys and values, and typically you won't have anything complex for keys as they are almost a label to describe the data they associate to. Its common, however, for values to be arrays or hashes:

```
  >> student["pocket"] = ["keys", "chewing gum"]
  
  >> student
  => {"name"=>"Lawrence", "height"=>74, "age"=>18, "pocket" => ["keys", "chewing gum"] }
  
  >> student["marks"] = {"math" => "A", "history" => "B", "PT" => "A+"}
  
  >> student
  =>{"name"=>"Lawrence", "height"=>74, "age"=>18, "pocket" => ["keys", "chewing gum"] , "marks" => {"math" => "A", "history" => "B", "PT" => "A+"} }
  
```



## Nested example


Let's create couple of arrays:

```
  >> states = { "California" => "CA", "Oregon" => "OR", "Florida" => "FL"}
  => {"California"=>"CA", "Oregon"=>"OR", "Florida"=>"FL"}

  >> cities = {"FL"=>"Miami", "OR" => "Portland", "CA" => "San Francisco"}
  => {"FL"=>"Miami", "OR" => "Portland", "CA" => "San Francisco"}


  >> states["California"]
  => "CA"

  >> states["New York"] = "NY"
  => "NY"


  >> cities[states["Florida"]]
  => "Miami"
```


###Assessment Exercise:

  https://gist.github.com/wofockham/6ae8484378ed60538756





**************



#Symbols

##Definition

Like most other things in Ruby symbols are objects. Symbol is the most basic ruby object you can create, its just a name and an internal ID.

What helped me understand symbol is that it is a "thing/object" which has an ID representation and a string representation.

We don't tend to use ID very often, but mostly rely on the string representation of it.


##Syntax

What do symbols look like?Most symbols looks like a colon followed by a non-quoted string:

__:myname__

Another way to make a symbol is with a colon followed by a quoted string:

__:"myname"__

which is how you make a symbol whose string representation contains spaces:

:"I was here and now i'm gone"

The preceding is also a symbol. Its string representation is: "I was here and now i'm gone"


##Mutability

A symbol is immutable. This means it cannot be mutated. Once initialised, when referring to the same symbol it refers to exactly same one. For example every time you use a string for something a new object is created

Lets see what it actually means ?
Back in my interactive ruby (irb):

```
  >> "i'm string".object_id
  => 70249731549580

  >> "i'm string".object_id
  => 70249731466920
```

```
	>> 5.object_id
	=> 11	
	>> 5.object_id
	=> 11

```
So every time we use a string we are creating a new object. We can store a string object in a variable:


``` 
	  >> third_string = "i'm string"
	  => "i'm string"
```
Once we stored it in the variable, everytime we use this variable, we are using the same object


```
	  >> third_string.object_id
	  => 70249731374980
```
  
Lets mutate one of our string objects, since we captured the string value in our variable third_string we can now use this variable to mutate our object:

```
  >>third_string[7] = "o"
  
  >> third_string
  => "i'm strong"
```

now lets check the id of our object: 

```
  >> third_string.object_id
  => 70249731374980
```
  
So we are still talking to the same object, eventhough we changed the value of it.

Not everything is mutable in ruby, we cannot mutate symbols or numbers. This is a decision that is made when the language is designed, so Matz decided that we should be able to change the value of the string object, and he also gave us symbol object, which is immutable and cannot change. No matter how many times :my_symbol pops up in our program it always refers to the same object:
  
```
  >> :my_symbol.object_id
  => 515368
  
  >> :my_symbol.object_id
  => 515368
```

another way to demonstrate this:

```
  >> first_symbol = :hello
  => :hello
  
  >> second_symbol = :hello
  => :hello
  
  >> first_symbol.object_id
  => 515688
  
  >> second_symbol.object_id
  => 515688
```

So we stored the same symbol in two variables, and when we check the object_id on those variables they are exactly the same.


## Usage


A symbol is stored in one place in memory. They are totally unique. This means they are more efficient when we are doing comparisons or lookups.


Here is an example:

```
  know_ruby = :yes  
  if know_ruby == :yes  
    puts 'You are a Rubyist'  
  else  
    puts 'Start learning Ruby'  
  end
```
  
In this example, :yes is a symbol. Symbols are just another datatypes, they don't contain values or objects, like variables do. Instead, they're used as a consistent name within code. For example, in the preceding code you could easily replace the symbol with a string, as in example below:

```
  know_ruby = 'yes'  
  if know_ruby == 'yes'  
    puts 'You are a Rubyist'  
  else  
    puts 'Start learning Ruby'  
  end  
```

This gives the same result, but isn't as efficient. In this example, every mention of 'yes' creates a new object stored separately in memory, whereas symbols are unique single reference values that and are only initialized once. In the first code example, only :yes exists, whereas in the second example you end up with the full strings of 'yes' and 'yes' taking up memory.


We can convert a string into a symbol by using .to_sym or .intern
We can also transform a String into a Symbol and vice-versa:

```
  "string".to_sym
  :symbol.to_s  
```


##What can symbols do for you? 

A symbol is a way to pass string information, always assuming that:
  
- The symbol needn't be changed at runtime, therefore they are unique and more efficient
- The symbol doesn't have methods of class String, ie they are "lighter".
- They are more readable.

What are the downsides?

- Because they are immutable, they are less flexible
- They have less methods, so are less versatile



##Symbols in Hashes:

We said that we can use anything to denote our keys, but strings are useful because they bear some context to us humans so we can label the data stored in our hash. 
However, it is more efficient to use symbols as keys, the name of a symbol bears a meaning plus it is much faster for ruby to search through the hash using symbols rather than using strings.

If you use a string as a hash key ruby needs to evaluate the string and look at its contents and then compare the result against the values of the keys which are already stored.


If you use symbol as a key then, since symbol is immutable ie Ruby knows that its value cannot change, and therefore doesn't need to compare values, it can just compare object_id of the key we are trying to look up against the object_id of keys which are already stored in the hash and this is much faster

So when we are using symbols as keys we also have an added benefit of a simplified syntax:

instead of:
  
  __{:name => "Michael", :age => 18, :occupation => "instructor"}__

we can use:

  __{name: "Michael", age: 18, occupation: "instructor"}__



#Summary


Hashes are basically associative arrays, a collection of key-value pairs where values are associated with a key, you may not be able to rely on their order but you can access data using keys, which makes them great for storing extra information about their contents.

If you hear that object is mutable or not, this just describes whether we can or not change an object after it was initialised.

Symbols are like strings, and often used in place of them – but are always the same instance.
Given symbol name refers to the same object throughout a ruby program.
We use symbols for keys in hashes, because like strings they allow us to "label" our data but they are more efficient.

