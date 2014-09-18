require 'pry'

file = File.new("potter.csv", "r")

char_arr = []

file.each_line do |character_string|
	char_minus_new_line = character_string.chomp
	arr_representing_char = char_minus_new_line.split(',')
	character = {}
	character[:mentions] = arr_representing_char[0]
	character[:name] = arr_representing_char[1]
	character[:house] = arr_representing_char[2]
	char_arr << character
end

binding.pry