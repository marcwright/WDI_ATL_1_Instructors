# Testing our code

## Framing & objectives

- We saw a brief example of unit testing the other day with the reversing a string talk. 
- And we've said a few times that we want to be able to test our software automatically. 
- And yesterday, building the linked list, it took us a long time to run through things every single time we changed things. 
  - Plus we didn't test everything; we just tested the parts that we thought we'd changed. And we're fallible. 


## Automated testing

- So we're going to write some tests for our linked list. Why? 
  - So we can be sure it works. 
  - So we know if we've broken something. 
  - So we know it works FOREVER.
    - Nobody else is going to come along and change things.
  - It saves us time in the long run. 
- We call these unit tests, because they test one unit of functionality. 
  - If we know that our individual bricks work, then it's more likely that our complete system will work. 

- So what do we want to test? 
  - Expected behaviour
  - Unexpected behaviour
  - Boundary behaviour. 

- We want to make sure that things we think work, will actually work. 
- We want to make sure that things we think break, will actually break. 
- And we want to make sure that things on the edge are actually on the edge.

## Writing unit tests in Ruby. 
- There is more than one way to do it. But Ruby comes with the test/unit framework. 

```
require 'test/unit'
class TestLinkedList < Test::Unit::TestCase
  def setup
    @list = LinkedList.new
    @words = %w{foo bar baz rectangle america megaphone monday}
  end
end
```

- Setup runs before each of our test methods. It's making sure that we have 'fresh' data for each run. 
- You should never write unit tests that presume they get executed in order. They should all be standalone.
- And you should have different tests for each bit of behaviour. 

- Let's test adding elements to our list, and make sure that our list grows. 

```
def test_add
  count = 0
  @words.each do |w| 
    @list << w
    count += 1
    assert_equal @list.length, count
  end
end
```

- What about accessing elements by index? 

```
def test_indices
  @words.each { |w| @list << w } 
  assert_nil @list[100]

  for i in (0..@words.length)
    assert_equal @words[i], @list[i]
  end
end
```

- And what about assignment? 

```
def test_indices_assignment
  @words.each { |w| @list << w }
  assert_equal @words[3], @list[3]
  @list[3] = "new word"
  assert_equal "new word", @list[3]
  for i in (0...@words.length)
    unless i == 3
      assert_equal @words[i], @list[i]
    end
  end
end
```

- And list equality? 

```
def test_list_equality
  @first = LinkedList.new
  @second = LinkedList.new

  assert_equal @first, @second, "Empty lists are equal."
  @first << "cat"
  assert_not_equal @first, @second, "Add an item to a list makes it unequal."
  @second << "cat"
  assert_equal @first, @second

  @first << "dog"
  @first << "bat"
  @second << "dog"
  @second << "bat"
  assert_equal @first, @second

  @first << "sheep"
  @first << "moose"
  @second << "moose"
  @second << "sheep"
  assert_not_equal @first, @second, "Different order means different lists."
end
```

## What about test-driven development? 

- We talk about test-driven development. But what does that actually mean? 
- It doesn't mean we write tests for our code. We should do that anyway. 
- It means we write our tests first. 

- Let's look at that behaviour of adding stuff beyond the end of our list. If we were writing an array, it should set the intermediate values to nil. 

```
def test_extended_assignment
  @words.each { |w| @list << w }
  assert @list.length < 90
  @list[100] = 'avocado'
  assert_equal 100, @list.length
  for index in (@words.length..100) 
    assert_equal nil, @list[index]
  end
  assert_equal 'avocado', @list[100]
end
```

- This test hit an error! Why? 
  - Because we told it to. We raised a RuntimeError. 
- So, let's change our code. In our if block in our `[]=` method: 

```
missing_node_count = self.length - index - 1
missing_node_count.times { self << nil }
self << value
```

- Run it. 
- We get an error! So our code doesn't work. 
  - This is a good thing! 
  - We found our bug quickly. 
- Change our missing_node_count to `index - self.length - 1`
- We get another error! 
- What's our error? 
  - I'll give you a clue. It's not in our LinkedList. It's in our test. 
  - How long did I assert my list to be?
  - If I assign to element 100, how long is it? 

- So we have to fix our test, not our code. 
- It's something to be aware of. 

- Re-run it. 
- Will still fail. 
- Something we expected to be nil was not nil. Which element? 
- We can add some explanatory text. 
  - `assert_equal nil, @list[index], "list[#{index}] should be nil."`
- Change our for loop to `@words.length..99`
- Ta da!
  


