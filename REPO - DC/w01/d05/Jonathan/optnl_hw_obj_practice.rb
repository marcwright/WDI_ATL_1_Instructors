# Define and write 3 class declarations

require 'pry'

# Pre-Homework
# Just testing a basic class first

# class Shirt
#   def initialize
#     puts 'This is a shirt.'
#   end
# end

# hoodie = Shirt.new
# puts hoodie

# Define the class "Shirt" and return 3 instance variables from 3 arguments
# class Shirt
#   def initialize(size, color, text)
#     @size = size
#     @color = color
#     @text = text
#   end
# end

pearl_jam_t = Shirt.new('Extra Large', 'Nicely Faded Black', 'Yield Tour 1998')
puts pearl_jam_t

hipster_plaid = Shirt.new('Medium', 'Red', 'NO LOGO!')
puts hipster_plaid

david_beckham_jersey = Shirt.new('White', 'Large', 'Beckham')
puts david_beckham_jersey

# Car
class Car
  def initialize(year, brand, model, color)
    @year = year
    @brand = brand
    @model = model
    @color = color
  end
end


  start_engine = Car.new("Vrum vrum vrum!")
# binding.pry
