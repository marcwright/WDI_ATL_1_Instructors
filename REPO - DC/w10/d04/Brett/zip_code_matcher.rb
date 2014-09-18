

def is_valid_zip(zip)

  pattern = /\A[0-9]{5}(-[0-9]{4})?\z/
  pattern.match(zip)

end

puts is_valid_zip("20002")
puts is_valid_zip("20002-4424")
puts is_valid_zip("123")
