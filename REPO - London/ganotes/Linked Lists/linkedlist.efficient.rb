class Node
	attr_accessor :value
	attr_accessor :next, :previous

	def initialize(value)
		@value = value
		@next = nil
    @previous = nil
	end
end

class LinkedList
  attr_reader :traversal_count, :length

	def initialize
		@head = nil
    @tail = nil
    @last_node = nil
    @last_index = nil
    @traversal_count = 0
    @length = 0
	end

	def <<(value)
		new_node = Node.new(value)
		new_node.next = @head
    @tail = @head unless @tail
    @head.previous = new_node if @head
    @length += 1
		@head = new_node
	end

  def [](index)
    if index > @length
      nil
    else
      node = self._get_node_at(index)
      node.value if node
    end
  end

  def []=(index, value)
    if index > @length
      raise RuntimeError
    else
      self._get_node_at(index).value = value
    end
  end

  def _get_node_at(index)
    if index > @length
      nil
    else

      candidates = [[@head, @length - 1, :next, @length - index - 1], [@tail, 0, :previous, index]]
      if @last_index
        candidates << [@last_node, @last_index, @last_index > index ? :next : :previous, (@last_index - index).abs]
      end
      choice = candidates.reduce {|a, b|
        if b[1]
          (a[1]-index).abs < (b[1]-index).abs ? a : b
        else
          a
        end
      }

      node, jumps, method = choice[0], choice[3], choice[2]
      @traversal_count += jumps
      jumps.times { node = node.__send__(method) }

      @last_node = node
      @last_index = index
      node
    end
  end

  def ==(comparison_list)
    if comparison_list.length != @length
      false
    else
      for i in (0...@length)
        @traversal_count += 1
        if self[i] != comparison_list[i]
          return false
        end
      end
      true
    end
  end


	def show
		output = ""
		node = @head
		while node
			output += "#{node.value}"
			output += " -> " if node.next
			node = node.next
      @traversal_count += 1
		end
		output
	end

	def delete(value_to_delete)
		if @head.value == value_to_delete
      @traversal_count += 1
      @length -= 1
			@head = @head.next
		else
			previous_node = @head
			current_node = @head.next
			while current_node
				if current_node.value == value_to_delete
          @length -= 1
					previous_node.next = current_node.next
				else
					previous_node = current_node
				end
        @traversal_count += 1
				current_node = current_node.next
			end
		end
	end
end


require 'test/unit'
class TestLinkedList < Test::Unit::TestCase
  def setup
    @list = LinkedList.new
    @words = %w{foo bar baz rectangle america megaphone monday}
    @method = ""
  end

  def teardown
    puts "    In the course of #{@method} we performed #{@list.traversal_count} node traversals.\n"
  end

  def test_add
    @method = "test_add"
    count = 0
    @words.each do |w|
      @list << w
      count += 1
      assert_equal @list.length, count
    end
  end

  def test_indices
    @method = "test_indices"
    @words.each { |w| @list << w }

    assert_nil @list[100]

    for i in (0...@words.length)
      assert_equal @words[i],  @list[i]
    end
  end

  def test_indices_assignment
    @method = "test_indices_assignment"
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

  def test_list_equality
    @method = "test_list_equality"
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
