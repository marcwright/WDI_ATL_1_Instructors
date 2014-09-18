require "test/unit"

class TestStringReversal < Test::Unit::TestCase
  def setup
    @methods = self.methods.select {|name| name.to_s.include? "reverse"}
  end

  def test_string_reversal
    @methods.each do |method|
      assert_equal self.__send__(method, ""), ""
      assert_equal self.__send__(method, "a"), "a"
      assert_equal self.__send__(method, "C"), "C"
      assert_equal self.__send__(method, "."), "."
      assert_equal self.__send__(method, "cat"), "tac"
      assert_equal self.__send__(method, "Cat!"), "!taC"
      assert_equal self.__send__(method, "These are several words"), "sdrow lareves era esehT"
      assert_equal self.__send__(method, "Never odd or even"), "neve ro ddo reveN"
    end
    puts "#{@methods.length} methods to reverse a string."
  end

  def ruby_reverse(string)
    string.reverse
  end

  def recursive_reverse(string)
    # don't forget, recursive methods need a 'base case'
    if string.empty? || string.length == 1
      string
    else
      string[-1] + recursive_reverse(string[0...-1])
    end
  end

  def recursive_reverse_2(string)
    if string.empty? || string.length == 1
      string
    else
      recursive_reverse_2(string[1..-1]) + string[0]
    end
  end

  def block_reverse(string)
    reversed_string = ""
    string.chars.each { |c| reversed_string = c + reversed_string }
    reversed_string
  end

  def loop_reverse(string)
    reversed_string = ""
    i = 0
    until i >= string.length
      reversed_string = string[i] + reversed_string
      i += 1
    end
    reversed_string
  end

  def loop_reverse_2(string)
    reversed_string = ""
    for i in (0...string.length)
      reversed_string = string[i] + reversed_string
    end
    reversed_string
  end

  def loop_reverse_3(string)
    reversed_string = ""
    start = string.length-1
    start.downto(0).each {|i|
      reversed_string += string[i]
    }
    reversed_string
  end

  def block_magic_reverse(string)
    string.chars.to_a.reverse.join
  end

  def array_reverse(string)
    result_array = []
    string.chars.each {|c| result_array.unshift(c) }
    result_array.join
  end

  def in_place_reverse(string)
    for i in (0..(string.length/2)-1)
      first = i
      last = string.length-1-i

      temp = string[first]
      string[first] = string[last]
      string[last] = temp
    end
    string
  end

  def in_place_recursive_reverse(string)
    if string.empty? || string.length == 1
      string
    else
      string[-1] + in_place_recursive_reverse(string[1...-1]) + string[0]
    end
  end

  def recursive_reverse_with_regex(string)
    if string.empty? || string.length == 1
      string
    else
      string.gsub(/^(.).*(.)$/, '\2' + recursive_reverse_with_regex(string[1...-1]) + '\1')
    end
  end
end
