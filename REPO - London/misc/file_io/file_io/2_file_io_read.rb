require 'pry'

class Person
  attr_accessor :name, :age, :sex, :apartment

  def initialize(name, age, sex)
    @name, @age, @sex = name, age, sex
  end

  def to_s
    "#{@name} is a #{@age} year old #{@sex}."
  end
end


# f = File.new('database.txt', 'r')
# begin
#   f.each do |line|
#     puts "the line says: '#{line.chomp}'"
#   end
# ensure
#   f.close
# end

f = File.new('database.txt', 'r')
begin
  people = []
  f.each do |line|
    person_array = line.chomp.split(", ")
    person = Person.new(person_array[0], person_array[1], person_array[2])
    people << person
  end
ensure
  f.close
end


people.each do |person|
  puts person.to_s
end



# binding.pry
