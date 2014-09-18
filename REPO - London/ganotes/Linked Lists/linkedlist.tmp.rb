class Node
	attr_accessor :value
	attr_accessor :next

	def initialize(value)
		@value = value
		@next = nil
	end
end

class LinkedList
  attr_reader :traversal_count, :length

	def initialize
		@head = nil
    @traversal_count = 0
    @length = 0

    @current_node_index = nil
    @current_node = nil
	end

	def <<(value)
		new_node = Node.new(value)
		new_node.next = @head
		@head = new_node
    @length += 1
	end

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

  def [](index)
    if index > self.length
      nil
    else
      node = self._get_node_at(index)
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
      node = self._get_node_at(index)
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

end


require 'test/unit'
class TestLinkedList < Test::Unit::TestCase
  def setup
    @list = LinkedList.new
    @words = %w{foo bar baz rectangle america megaphone monday}
    @method = ""
  end

  def teardown
    puts "In the course of #{@method} we performed #{@list.traversal_count} jumps."
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

  def test_efficient_indices
    @method = "test_efficient_indices"
    (0..1000).each {|n| @list << n }
    for i in (0..1000)
      assert_equal @list[i], i
    end
  end

  def test_efficient_indices_backwards
    @method = "test_efficient_indices_backwards"
    (0..1000).each {|n| @list << n }
    for i in (0..1000).to_a.reverse
      assert_equal @list[i], i
    end
  end

  def test_random_indices
    @method = "test_random_indices"
    (0..1000).each {|n| @list << n }
    nums = (0..1000).to_a.shuffle
    nums.each { |n| assert_equal @list[n], n }
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

  def test_extended_assignment
    @method = "test_extended_assignment"
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
