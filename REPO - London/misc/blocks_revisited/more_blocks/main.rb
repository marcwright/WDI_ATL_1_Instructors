require 'pry'


def gimme_a_block
  puts "where is the block?"
  if block_given?
  yield
else
  puts "ain't got one"
end
end


def talk_to_fred
  yield "fred"
end
binding.pry

