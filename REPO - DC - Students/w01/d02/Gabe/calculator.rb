
puts "CALCULATOR".center(40)




#input module:
puts "---------------menu-------------------"
puts "  operation              code :       "
puts "                                      "
puts "   add  . . . . . . . . . a           "
puts "   subtract  . . . . . . .s           "
puts "   divide  . . . . . . . .d           "
puts "   multiply  . . . . . . .m           "
puts "   exponent . . . . . . . x           "
puts "   square root  . . . . . q           "
puts "   sin  . . . . . . . . . n           "
puts "   cos  . . . . . . . . . c           "
puts "   tan  . . . . . . . . . t           "
puts "   factorial  . . . . . . k           "
puts "                                      "
puts "--------------------------------------"


print "number 1:"
num1 = gets.chomp.to_f

print "please select your operation:"
operation = gets.chomp

print "number 2:"
num2 = gets.chomp.to_f


#mathematic operations modules:
case operation

	when "a"
		print "#{num1} + #{num2} = "
		newnum =  num1 + num2
		puts newnum
		puts ""
		
		return
	

	when "s"
		print "#{num1} - #{num2} = "
		newnum =  num1 - num2
		puts newnum
		puts ""
		
		return


	when "d"
		print "#{num1} / #{num2} = "
		newnum =  num1 / num2
		puts newnum
		puts ""
		
		return

	when "m"
		print "#{num1} * #{num2} = "
		newnum =  num1 * num2
		puts newnum
		puts ""
		
		return

end
 

#menu module

def menu
puts "---------------menu-------------------"
puts "  operation              code :       "
puts "                                      "
puts "   add  . . . . . . . . . a           "
puts "   subtract  . . . . . . .s           "
puts "   divide  . . . . . . . .d           "
puts "   multiply  . . . . . . .m           "
puts "   exponent . . . . . . . x           "
puts "   square root  . . . . . q           "
puts "   sin  . . . . . . . . . n           "
puts "   cos  . . . . . . . . . c           "
puts "   tan  . . . . . . . . . t           "
puts "   factorial  . . . . . . k           "
puts "                                      "
puts "--------------------------------------"
end





#operation definitions:

def a(num_1, num2)

	num1 + num2

end
