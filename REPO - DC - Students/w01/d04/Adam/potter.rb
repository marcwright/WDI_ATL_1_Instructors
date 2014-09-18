require 'pry'
require 'csv'

potter = CSV.read('potter.csv') do |row|
  puts row.inspect
end

CSV.foreach('potter.csv') do |row|
  puts row.inspect
end

#1 Names of all the characters
CSV.foreach('potter.csv') do |row|
  puts row[1]
end

#2 Characters with more than 500 mentions
#CSV.foreach('potter.csv') do |row|
#  puts row.inspect
#  if row[1]to_i > 500 then
#    puts row.inspect
#  end
#end

#Array with name of Houses
CSV.foreach('potter.csv') do |row|
  puts row[2].uniq?
end


# Block to csv.parse

#CSV.parse(a_string) { |row| puts row.inspect }

binding.pry
