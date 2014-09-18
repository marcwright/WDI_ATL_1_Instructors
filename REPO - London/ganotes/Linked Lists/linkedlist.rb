class Node
	attr_reader :value
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

	# def add(value)
	# 	new_node = Node.new(value)
	# 	unless @head
	# 		@head = new_node
	# 	else
	# 		node = @head
	# 		while node.next
	# 			node = node.next
	# 		end
	# 		node.next = new_node
	# 	end
	# end

	def <<(value)
		new_node = Node.new(value)
		new_node.next = @head
		@head = new_node
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



list = LinkedList.new
puts "List has #{list.length} elements: #{list.show}"
list << 5
puts "List has #{list.length} elements: #{list.show}"
list << -1
puts "List has #{list.length} elements: #{list.show}"
list << -1
puts "List has #{list.length} elements: #{list.show}"
list << -1
puts "List has #{list.length} elements: #{list.show}"
list << "foo"
puts "List has #{list.length} elements: #{list.show}"
list.delete(-1)
puts "List has #{list.length} elements: #{list.show}"
(1..100).each {|n| list << n}

puts "List has #{list.length} elements: #{list.show}"
