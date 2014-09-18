# Blocks revisited - yield & inject (45mins)
  - We were passing blocks to our enumerable objects; but blocks _are_ objects too
    - The code:
      my_array.each { |e| puts e }

    - Means that *somewhere* there's a "def each" method... how would it look?


  - Our own block:
  def gimme_a_block
    puts "where's the block?"
    #yield
  end
  gimme_a_block { puts "here I am" }

  - ensuring a block is given:
  def hiya
    if block_given?
      yield
    else
      puts "no block given :-("
    end
  end
  hiya { puts "hiya" }

  - Block parameters:
  def talk_to_fred
    yield "fred"
  end
  talk_to_fred { |i| puts "hiya, #{i}" }

  - This is what powers enumerable - each element is yielded to the block, and different enumerable methods do different things with the result
    %w(Fred Wilma Barney).each { |name| print name, " " }


  - inject / reduce
    - I skipped over this one in enumerable... but

    x = 0
    (5..10).each do |i|
      x += i
    end
    x => 45

    - is the same as:

    (5..10).reduce(0) do |sum, value|
      sum + value
    end
    => 45

    - is the same as:

    (5..10).reduce(:+)
    => 45

    - This is a very common Ruby idiom
    %w(the quick brown fox).map(&:reverse)


  - object.send(:method)
