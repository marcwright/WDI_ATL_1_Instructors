# Linked Lists: efficiency

## Framing

- For most of the code you write, you don't have to worry about efficiency. 
- Working code is way more important than efficient code. 
- Computers are fast! Computers are cheap! Programmers are slow, and expensive. 
  - Better to make you wait an extra 0.5s a day than spend an hour trying to speed it up. 
- But. 
  - Sometimes it matters. 
  - Sometimes you hit performance issues that do impact you. 
  - And people like to ask this stuff in interviews, too. 
- We've seen one way of benchmarking our code before, what was that? 
  - Using the benchmark gem
  - We ran races. 
  - Whose was fastest? 
  - How do we know it was fastest? 
    - Because we tested it. 
    - **You can't improve what you can't measure.**

- Which also means you have to be measuring the right things.
- And helps you figure out which parts deserve your attention. 


## It's theoretical

- Today, we're working in a fairly theoretical world. We're just looking at the code. 
- Generally, the code will not be your bottleneck. 
  - The web is a bottleneck. Your DB is a bottleneck. 
  - There's no point changing your code from 10ms to 5ms if your database takes 300ms to get back to you. 


## Linked lists

- So, what are we doing with our linked lists? What do we think is going to be the biggest slowdown? 
  - Probably following those links, right? 
  - So, how many jumps are we doing? 
  - Let's find out. Let's update our linked list to remember it. In our initialise: `@traversal_count = 0`
    - And anywhere else we update it. 
    - Attr_reader for the traversal_count
  - And let's update our unit test so we display our counts at the end of each method. 
    ```
    def teardown
      puts "In the course of #{@method} we performed #{@list.traversal_count} jumps."
    end
    ```
  - Add @method calls to each test. 
  - And add a couple more tests. 
    ```
 def test_efficient_indices
    @method = "test_efficient_indices"
    (0..1000).each {|n| @list << n }
    for i in (0..1000)
      assert_equal @list[i], i
    end
  end

  def test_random_indices
    @method = "test_random_indices"
    (0..1000).each {|n| @list << n }
    nums = (0..1000).to_a.shuffle
    nums.each { |n| assert_equal @list[n], n }
  end
```

  - Run it. 2.5 million jumps! 


## List length

- What method do we think we're using most? 
- We use length a lot. And every time, it has to walk the entire list. 
- Maybe we shouldn't calculate it each time? 
  - Add attr_reader :length
  - Add one whenever we add a node. 
  - Our interface hasn't changed! We still call .length
  - We've got a unit test on it, so we can be sure it works. 
- Drops down to 500,000 jumps. 


## List access

- Right now, most of the time we do **sequential access** to our list. 
  - After accessing element 1, we access element 2, then element 3, and so on. 
- Let's add a test method that walks our list backwards. 
  ```
  def test_efficient_indices_backwards
    @method = "test_efficient_indices_backwards"
    (0..1000).each {|n| @list << n }
    for i in (0..1000).to_a.reverse
      assert_equal @list[i], i
    end
  end
  ```

- So... what if our list remembered the last index, and the last node, and used that if it's closer? 
- Let's replace our loops in [] and []= with a _get_node_at method. 
- And let's update our _get_node_at method so it remembers the last node accessed, and uses that one if it's closer. 
  ```
  def _get_node_at(index)
    if @current_node_index && @current_node_index >= index
      jumps = @current_node_index - index
      node = @current_node
    else
      jumps = self.length - index-1
      node = @head
    end
    jumps.times { node = node.next }
    @traversal_count += jumps
    @current_node_index = index
    @current_node = node
    node
  end
```
- Run it...
  - Forward: 500500 accesses. 
  - Backward: 1000 accesses. 
  - Cool! 
    - But not cool enough... 
    - How often do we walk *backwards* through our lists? 
    - Access patterns matter.
    - Remember how we switched our add method from O(n) to O(1)? If we'd done this the O(1) way, then we'd get this for our forward list instead. 
    - Do we write more than we read? Maybe it's better to have O(1) on write and O(1) on read, rather than O(1) on write and O(n²) on read.

