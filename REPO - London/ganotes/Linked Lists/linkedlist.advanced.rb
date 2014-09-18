class Node
	attr_accessor :value
	attr_accessor :next

	def initialize(value)
		@value = value
		@next = nil
	end
end

class LinkedList
	def initialize
		@head = nil
	end

	def <<(value)
		new_node = Node.new(value)
		new_node.next = @head
		@head = new_node
	end

  def [](index)
    if index > self.length
      nil
    else
      jumps = self.length - index-1
      node = @head
      jumps.times { node = node.next }
      node.value
    end
  end

  def []=(index, value)
    if index >= self.length
      # Figure out how many items to add, and add them.
      missing_node_count = index - self.length
      missing_node_count.times { self << nil }
      self << value
      self.show
    else
      jumps = self.length - index-1
      node = @head
      jumps.times { node = node.next }
      node.value = value
    end
  end

  def ==(comparison_list)
    if comparison_list.length != self.length
      false
    else
      for i in (0...self.length)
        if self[i] != comparison_list[i]
          return false
        end
      end
      true
    end
  end


	def length
		length = 0
		node = @head
		if node
			length = 1
			while node = node.next
				length += 1
			end
		end
		length
	end

	def show
		output = ""
		node = @head
		while node
			output += "#{node.value}"
			output += " -> " if node.next
			node = node.next
		end
		output
	end

	def delete(value_to_delete)
		if @head.value == value_to_delete
			@head = @head.next
		else
			previous_node = @head
			current_node = @head.next
			while current_node
				if current_node.value == value_to_delete
					previous_node.next = current_node.next
				else
					previous_node = current_node
				end
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

  def test_extended_assignment
    @words.each { |w| @list << w }
    assert @list.length < 90
    @list[100] = 'avocado'
    assert_equal 101, @list.length
    for i in (@words.length..99)
      assert_equal nil, @list[i], "list[#{i}] should be nil."
    end
    assert_equal 'avocado', @list[100]
  end


end
