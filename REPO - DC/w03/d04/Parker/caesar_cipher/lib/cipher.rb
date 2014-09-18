# 
def caesar_cipher(text, num = 3)
	cipher = ''
	text.each_char  do |letter|
	# converts letter to ascii and shifts
	val = letter.ord + (num % 26) 
	# sets upcase letter to value  within 65 and 90, aschii values for A-Z
	if letter =~ /[A-Z]/ && val > 90
		val = (val % 90) + 64
	# sets lowercase letter to value within 97 and 122, ascii values a-z
	elsif letter =~ /[a-z]/ && val > 122
		val = (val % 122) + 96
	# sets puncation to ascii value without shifting
	elsif letter =~ /[^A-Za-z]/
		val = letter.ord
	end
	cipher += val.chr
	end
	cipher
end

s = 'What a string!'
# rot13 is a caesar_cipher given n = 13.
# if you run rot13 a second time, it will decipher message.
rot13 = caesar_cipher(s, 13)
puts rot13
puts caesar_cipher(rot13, 13)

# def cipher(text, num)
#   alphabet = "abcdefghijklmnopqrstuvwxyz"
#   transformed_text = ""
#   text.split("").each do |char|
#     if "?.,! ".include?(char)
#       transformed_text << char
#     else
#       transformed_char = alphabet[(alphabet.index(char.downcase) + num) % alphabet.size]
#       if char == char.upcase
#         transformed_text << transformed_char.upcase
#       else
#         transformed_text << transformed_char
#       end
#     end
#   end
#   return transformed_text.strip
# end

# print cipher("Hello!", 5)

# def caesar_cipher(text, num = 3)
# 	cipher = ''
# 	text.each_char  do |letter|
# 	# converts letter to ascii and shifts
# 	val = letter.ord + (num % 26) 
# 	# sets upcase letter to value  within 65 and 90, aschii values for A-Z
# 	if letter =~ /[A-Z]/ && val > 90
# 		val = (val % 90) + 64
# 	# sets lowercase letter to value within 97 and 122, ascii values a-z
# 	elsif letter =~ /[a-z]/ && val > 122
# 		val = (val % 122) + 96
# 	# sets puncation to ascii value without shifting
# 	elsif letter =~ /[^A-Za-z]/
# 		val = letter.ord
# 	end
# 	cipher += val.chr
# 	end
# 	cipher
# end

# s = 'What a string!'
# # rot13 is a caesar_cipher given n = 13.
# # if you run rot13 a second time, it will decipher message.
# rot13 = caesar_cipher(s, 13)
# puts rot13
# puts caesar_cipher(rot13, 13)

# class Cipher
#   def initialize(shift, alphabet = ('a'..'z').to_a.join)
#     i = shift % alphabet.size 
#     @hello = alphabet
#     @peter = alphabet[i..-1] + alphabet[0...i]
#   end

#   def hello(string)
#     string.tr(@decrypt, @encrypt)
#   end

#   def peter(string)
#     string.tr(@encrypt, @decrypt)
#   end
# end

# module CaesarCipher
#   AtoZ = (0..25).each_with_object({}) do |key,h|
#     str = [*"A".."Z"].rotate(key).join
#     h[key] = str + str.downcase
#   end
 
#   def encrypt(key, plaintext)
#     (1..25) === key or raise ArgumentError, "key not in 1..25"
#     plaintext.tr(AtoZ[0], AtoZ[key])
#   end
 
#   def decrypt(key, ciphertext)
#     (1..25) === key or raise ArgumentError, "key not in 1..25"
#     ciphertext.tr(AtoZ[key], AtoZ[0])
#   end
# end
 
# include CaesarCipher
 
# original = "THEYBROKEOURCIPHEREVERYONECANREADTHIS"
# en = encrypt(3, original)
# de = decrypt(3, en)
 
# [original, en, de].each {|e| puts e}
 
# puts 'OK' if
#   (1..25).all? {|k| original == decrypt(k, encrypt(k, original))}



# def caesar_cipher(text, num = 3)
# 	cipher = ''
# 	text.each_char  do |letter|
# 	# converts letter to ascii and shifts
# 	val = letter.ord + (num % 26) 
# 	# sets upcase letter to value  within 65 and 90, aschii values for A-Z
# 	if letter =~ /[A-Z]/ && val > 90
# 		val = (val % 90) + 64
# 	# sets lowercase letter to value within 97 and 122, ascii values a-z
# 	elsif letter =~ /[a-z]/ && val > 122
# 		val = (val % 122) + 96
# 	# sets puncation to ascii value without shifting
# 	elsif letter =~ /[^A-Za-z]/
# 		val = letter.ord
# 	end
# 	cipher += val.chr
# 	end
# 	cipher
# end

# s = 'What a string!'
# # rot13 is a caesar_cipher given n = 13.
# # if you run rot13 a second time, it will decipher message.
# rot13 = caesar_cipher(s, 13)
# puts rot13
# puts caesar_cipher(rot13, 13)