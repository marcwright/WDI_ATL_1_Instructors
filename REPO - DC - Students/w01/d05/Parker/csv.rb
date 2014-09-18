require 'pry'

file = File.new("potter.csv", "r")

file.each_line do |character|
	binding.pry
end

