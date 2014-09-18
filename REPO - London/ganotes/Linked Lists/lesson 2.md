# Making our objects more Ruby-like


## Background 

- Yesterday we wrote the start of a collection class. 
- We could add elements to our list. 
- But we couldn't get them back. 
- Or change them once they're there. 
- Let's do that. 

```
def get(index)
  if index > self.length
    nil
  else
    jumps = self.length - 1 - index
    current_node = @head
    jumps.times { current_node = current_node.next_node }
    current_node.value
  end
end
```
- Remember, our link is internally storing the oldest stuff last. 
- So if we ask for `get(0)`, I need the last element... 
- which means I have to follow the links self.length - 1 times. 

- Let's do something similar for setting. 

```
def set(index, new_value)
  if index > self.length
    raise RuntimeError
  else
    jumps = self.length - 1 - index
    current_node = @head
    jumps.times { current_node = current_node.next_node } 
    current_node.value = new_value
  end
end
```
- Pretty much the same!
- Let's prove it works. 


- So how can we make this more like Ruby?
- If I want to add something to an array, what do I do? 
  - I shovel stuff into it. 
  - In some languages, that shovel would be a 'language primitive'. 
    - Which means it's built in and I can't change it. 
    - And it *is* an operator... but we can define our own. 
- Change our `add` method to be `def <<(value)`
  - That's really it. 
- So what do you think we'd change our 'get' method to? 
  - `def [](index)
- And our set method? (It's a bit weird, you might not guess this one.) 
  - `def []=(index, new_value)`

- So, what if we wanted to see if our lists were equal. What would be a natural thing to write in Ruby? `==`
  - What makes a list equal or not?
    - It should be the same length, right? 
    - And each list should have the same values, in the same order.
      - Doesn't have to be! 

```
def ==(comparison_list)
  if comparison_list.length != self.length
    return false
  else
    for i in (0..self.length)
      if self[i] != comparison_list[i]
        return false
      end
    end
    true
  end
end
```


# bonus: A unit test

- You can include this in the same file. 

```
require 'test/unit'
class TestLinkedList < Test::Unit::TestCase
  def setup
    @list = LinkedList.new
    @words = %w{foo bar baz rectangle america megaphone monday}
  end

  def test_add
    count = 0
    @words.each do |w|
      @list << w
      count += 1
      assert_equal @list.length, count
    end
  end

  def test_indices
    @words.each { |w| @list << w }

    assert_nil @list[100]

    for i in (0...@words.length)
      assert_equal @words[i],  @list[i]
    end
  end

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

end
```
