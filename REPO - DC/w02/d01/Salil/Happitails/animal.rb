def gets_input(prompt)
  puts prompt
  answer = gets.chomp
  return answer
end

class Animal

  attr_accessor :name
  attr_accessor :species
  attr_accessor :toys

  def initialize(name, species)
   @name = name
   @species = species
   @toys = []
  end

  def add_toys(num_toys)
    count = 0
    while count < num_toys.to_i
      puts "What toy does your animal have?"
      answer = gets.chomp
      @toys.push(answer)
      count += 1
    end
  end

end
