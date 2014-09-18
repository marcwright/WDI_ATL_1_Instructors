# Calculator.rb
# Stephen Stanwood (stephen@stanwoodsolutions.com)

def print_header()
  puts "###########################################################"
  puts "######################## CALCULATOR #######################"
  puts "==> OPERATIONS: +, -, *, /, exp, sqrt, sin, cos, tan, ! ###"
  puts "###########################################################"
end

def prompt_s(query)
  print query
  return gets.chomp
end

def prompt_i(query)
  print query
  return gets.chomp.to_i
end

# PRE: op parameter is lowercase
def unary?(op)
  return op == "sqrt" || op == "sin" || op == "cos" || op == "tan" || op == "!"
end

def fact(num)
  if num <= 1
    return num
  end

  return num * fact(num - 1)
end

print_header()

while true
  print "Pick an operation ('q' to quit): "
  op = gets.chomp.downcase

  if op == "q"
    break
  end

  if unary?(op)
    num = prompt_i("Number: ").to_f

    case op
    when "sqrt"
      print "sqrt(#{num}) = #{Math.sqrt(num)}"
    when "sin"
      print "sin(#{num}) = #{Math.sin(num)}"
    when "cos"
      print "cos(#{num}) = #{Math.cos(num)}"
    when "tan"
      print "tan(#{num}) = #{Math.tan(num)}"
    when "!"
      print "#{num.to_i}! = #{fact(num).to_i}"
    end
  else
    n1 = prompt_i("Number 1: ")
    n2 = prompt_i("Number 2: ")
    print "#{n1} #{op} #{n2} = "

    case op
    when "+"
      print n1 + n2
    when "-"
      print n1 - n2
    when "*"
      print n1 * n2
    when "/"
      print n1 / n2
    when "exp"
      print n1 ** n2
    else
      print "ERROR: (#{op} isn't a valid operation)"
    end
  end

  puts ""
  puts ""
end

puts "Thank you for using this calculator.  Have a great day!"
