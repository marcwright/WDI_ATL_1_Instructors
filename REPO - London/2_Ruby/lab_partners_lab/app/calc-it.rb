# Function definitions first
def menu
  # Clear the screen, and present the user with a menu
  puts `clear`
  puts "***CalcIt***"
  print "(s)tandard, (a)dvanced, (m)ortgage, (b)mi, (t)rip or (q)uit: "
  gets.chomp.downcase
end

def standard_calc
  # ask the user which operation they want to perform
  print "(a)dd, (s)ubtract, (m)ultiply, (d)ivide: "
  operation = gets.chomp.downcase

  # insert magic incatation here....
  puts "What is the first number?"
  number = gets.chomp.to_i
  puts "What is the second number?"
  secondnumber = gets.chomp.to_i

case
when 'a'
  puts number + secondnumber
  puts "Press enter to continue"
  gets
when 'b'
  puts number - secondnumber
  puts "Press enter to continue"
  gets
when 'm'
  puts number * secondnumber
  puts "Press enter to continue"
  gets
when 'd'
  puts number / secondnumber
  puts "Press enter to continue"
  gets
end
end

def advanced_calc

  print "(p)ower, (s)quareroot:"
  operation = gets.chomp.downcase
   print "first number: "
  a = gets.to_f

  if operation == 's'
    puts "#{Math.sqrt(a)}"
  else
    print "second number: "
    b = gets.to_f
    puts "#{a**b}"
  end
  gets
end

def mortgage_calc
  puts "What is the principle amount of the loan in £?"
  principle = gets.chomp.to_f
  puts "What is the interest rate?"
  interest = gets.chomp.to_f
  puts "What is the number of payments?"
  payments = gets.chomp.to_f
  i = interest / 12
  top = i * ((1+i)**payments)
  bottom = ((1 + i)**payments)-1
  puts "Your mortgage payment is £ #{principle * ( top / bottom)}. Press enter to continue."
  gets
end

def bmi_calc
  puts "Are you using metric or imperial"
  answer = gets.chomp

 # Originally used elsif statement, refactored it to use a case statement.

case answer
  when "metric" 
    puts "Please enter your weight KG"
      weight = gets.chomp.to_f
    puts "Please enter your height in meters"
      height = gets.chomp.to_f
      bmi = weight / (height * height)

    puts "Your BMI is #{bmi.round(2)}. Press enter to continue."
      gets

  when "imperial"
    puts "Please enter your weight in lb"
      weight = gets.chomp.to_f
    puts "Please enter your height inches"
      height = gets.chomp.to_f
      bmi1 = weight / (height * height) * 703

    puts "Your BMI is #{bmi1.round(2)}. Press enter to continue."
      gets

  else 
    puts "You did not put in a valid measurment unit. Press enter to continue."
      gets
    end
  end




  def trip_calc
    puts "How far will you drive in miles?"
    distance = gets.chomp.to_f
    puts "What is your miles per gallon?"
    mpg = gets.chomp.to_f
    puts "How much does your gas cost per gallon?"
    cost = gets.chomp.to_f
    puts "How fast will you drive?"
    speed = gets.chomp.to_f


    journey_cost = (distance / mpg) * cost
    journey_time = distance / speed 
    if speed <= 60
    puts "Your trip will take #{journey_time.round(2)} hours and cost $#{journey_cost.round(2)}. Press enter to continue"
    gets
  else
      puts "Your trip will take #{journey_time.round(2)} hours and cost $#{journey_cost.round(2)}. However due to your speed your miles per gallon will now be #{mpg -= 2}mpg. Press enter to continue."
     gets
  end
end




 



# run the app...

response = menu

while response != 'q'
  case response
  when 's'
    standard_calc
  when 'a'
    advanced_calc
  when 'm'
   mortgage_calc
  when 'b'
   bmi_calc
  when 't'
   trip_calc
  end
  response = menu
end