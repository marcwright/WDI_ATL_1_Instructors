require 'pry'

#==================================#
#==(1a) Return Names W/out Hash====#
#==================================#


# puts "Names of all characters: "

# p_file = File.new("potter.csv", "r")
#   p_file.each_line do |line|

#   potter_array = line.chomp.split(",")
#   puts potter_array[1]
#   puts
# end

#==================================#
#====(1b) Return Names=============#
#==================================#

puts "Names of all characters: "


p_file = File.new("potter.csv", "r")
  p_file.each_line do |line|
    potter_array = line.chomp.split(",")
    potter_hash = {:mention => potter_array[0].to_i, :name => potter_array[1], :house => potter_array[2]}
      puts potter_hash[:name] # Not an array
  end

puts
puts

#=====================================#
#==(2)Return Names w/ Mentions > 500==#
#=====================================#

puts "Characters with more than 500 mentions: "
puts
characters_array = []
p_file = File.new("potter.csv", "r")
  p_file.each_line do |line|
    potter_array = line.chomp.split(",")
    potter_hash = {:mention => potter_array[0], :name => potter_array[1], :house => potter_array[2]}
    characters_array.push(potter_hash)
  end
  # ==> Can't figure out why the variable is always out of scope.
  # Why is this different from the enum.rb examples?
  comparison = characters_array.select do |compare|
    compare[:mention].to_i > 500
  end
  # puts compare
  

#==================================#
#==(3) Return Each House Name======#
#==================================#

puts
puts "The Houses: "
puts
#Not an array, but I got close.
house_array = characters_array.map do |houses|
  houses[:house]
end
puts house_array.uniq


#==================================#
#==(4) Single Name Characters======#
#==================================#
puts
puts "Characters with Single Names: "
puts

single_array = characters_array.dup
single_array.delete_if do |single| 
  single[:name].include? (" ")
end
puts single_array

#==================================#
#==(5) Number of Hufflepuff People=#
#==================================#


characters_array do |count|
  count[:house](/Hufflepuff/)
end

