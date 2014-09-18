def valid(cc_num)
  cc_num_as_string = cc_num.to_s
  array_of_string_digits = cc_num_as_string.split('')
  index = -2

  while(array_of_string_digits[index])
    array_of_string_digits[index] = (cc_num_as_string[index].to_i * 2)
    index -= 2
  end

  new_string = array_of_string_digits.map(&:to_s).join('')
  sum = new_string.split('').map(&:to_i).reduce(:+)
  sum % 10 === 0
end
