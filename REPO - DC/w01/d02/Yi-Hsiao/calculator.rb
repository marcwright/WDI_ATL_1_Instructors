# #Calculator

# ###Objectives:
# - Practice with functions, loops, conditions, user-input, switch/case

# ###Prompt
# - You will be building a calculator.  A calculator can perform multiple arithmetic operations.  Your function should allow the user to choose which operation is expected, enter in the values to perform the operation on, and ultimately view the result.
# - You should make git commits as you finish each phase, so you can see the history

# ###Specification:
# - A user should be given a menu of operations
# - A user should be able to choose from the menu
# - A user should be able to enter numbers to perform the operation on
# - A user should be shown the result
# - This process should continue until the user selects a quit option from the menu

# #####Commit 1
# - Calculator functionality
#   - Calculator should be able to do basic arithmetic (+,-, *, /)

# #####Commit 2
# - Advanced Calculator functionality
#   - Calculator should be able to do basic arithmetic (exponents, square roots)

# #####Commit 3
# - User should be given a menu of Calculator functionality
# - User should be able to choose intended functionality
# - After each operation, the user should be returned to the menu until they quit

# #####Commit 4 (Bonus)
# - Add functionality for trigonometric functions (sin, cos, tan)
# - Add functionality to include a factorial option

require "pry"

class Calculator
  def initialize name
    @name = name
    @total = 0
    @commands = {
      q: "exit_calc",
      quit: "exit_calc",
      exit: "exit_calc",
      functions: "show_functions",
      c: "clear_total",
      clear: "clear_total",
      help: "show_help"
    }

    # help text for calculator
    @help_text = []
    @help_text << "This calculator performs basic math functions."
    @help_text << "To see a full list of functions, please type 'functions'"
    @help_text << "Type in a formula in the prompt.  For example: '2+2=' will update the total to 4."
    @help_text << "The calculator will update the total everytime you use an equal sign, '='"
    @help_text << "Typing '*3=' will update the total to 12 (4 * 3 = 12)."
    @help_text << "Typing 'c' or 'clear' will clear the total."
    @help_text << "To see this menu again, please type 'help'"
    @help_text << "To exit the calc, type 'exit' or 'q'"

    # functions for calculator
    @list_function = []
    @list_function << "Addition: 2+3 is 2 plus 3"
    @list_function << "Subtraction: 2-3 is 2 minus 3"
    @list_function << "Multiplication: 2*3 is 2 times 3"
    @list_function << "Division: 2/3 is 2 divided by 3"
    @list_function << "Exponents: 2^3 is 2 to the power of 3"
    @list_function << "Square Root: sqrt(2) is the square root of 2"
    @list_function << "Sin/cos/tan: sin(1) is the sine of 1 rad"
    @list_function << "Pi: pi is equal to 3.141529"
    @list_function << "Factorial: 3! is 3 factorial"

    show_intro
    main
  end

  def show_feed text, num_lines
    # prints blocks of lines at a time
    # gives user opportunity to skip feed
    text.each_slice(num_lines) do |s|
      puts s
      puts
      puts "(Enter any key to continue or 'Q' to exit.)"
      response = gets.chomp.downcase
      return if response == 'q'
    end
  end

  def show_help
    show_feed @help_text, 2
  end

  def show_intro
    puts "Welcome to the #{@name}. Type 'help' for more info."
    puts
  end

  def show_functions
    show_feed @list_function, 5
  end

  def exit_calc
    # exits the calculator
    puts "Thanks for using the #{@name}."
    return "exit"
  end

  def clear_total
    # clears the total stored in calculator's memory
    @total = 0
  end

  def evaluate expression
    begin
      @total = eval expression
    rescue SyntaxError, NameError => e
      puts "Sorry, I didn't understand that command.  Please see 'help' or 'functions' for more info."
    end
  end

  def format_exp user_input
    # changes user input into strings that can be interpreted by the eval method

    # calculate on the existing total
    expression = user_input =~ /^[\+-\/\*]/ ? "#{@total} #{user_input}" : string

    # adds the Math class to its constants and methods
    expression.gsub! /pi/i, "Math::PI"
    expression.gsub! /(sqrt|sin|cos|sin)/i, 'Math.\1'

    expression.gsub! /([0-9]+)\s*\(/, '\1 * (' # implicitly multiply with parentheses
    expression.gsub! /\^/, '**'                # exponentiate with ^ or ** notation
    expression.gsub! /([^0-9]+)\./, '\10.'     # add a zero in front of fractions
  end

  def check_input input
    input_sym = input.to_sym

    if @commands.has_key? input_sym
      self.send @commands[input_sym]
    else
      exp = format_exp input
      evaluate exp
    end
  end

  def main
    exit_flag = ""
    until exit_flag == "exit"
      puts "Total: #{@total}"
      user_input = gets.chomp
      puts
      exit_flag = check_input user_input
    end
  end
end

my_calc = Calculator.new "Calc-o-matic 9000"
