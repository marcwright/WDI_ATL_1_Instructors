# performs basic math operations (+, -, *, /) and returns the value
# performs the operation to any number of operands
post %r{/calculator/(add|subtract|multiply|divide)} do |operation|
  math_operation = case operation
  when "add" then :+
  when "subtract" then :-
  when "multiply" then :*
  when "divide" then :/
  end

  # only get the user submitted values in the post (exclude the native splat and captures key)
  user_submitted_values = params.reject { |key, value| ['splat', 'captures'].include?(key) }.values
  # only accept numeric strings and convert to a float to preserve decimals
  operands = user_submitted_values.map { |value| value.to_f if value =~ /^-?[0-9]+(\.[0-9]+)?$/ }.compact

  # if there's no acceptable values, return an error
  if operands.empty?
    return "Please enter some valid numbers."
  else
    # perform the same math operation to all numbers
    result = operands.reduce(math_operation)

    # saves the result to the calculator's history
    operation_separator = " #{ math_operation } "
    Calculation.create(calculation: "#{ operands.join( operation_separator ) } = #{ result }")

    # prints out an integer or a decimal with 2 places, based on the result
    "#{ result % 1 == 0 ? result.to_i : "%0.2f" % result }"
  end
end
