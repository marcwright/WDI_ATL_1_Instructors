def is_valid_zip(zip)
  pattern = /^[0-9]{5}(-[0-9]{4})?$/
    if pattern.match(zip) == nil
      return "That is not a valid zip-code"
    else
      return "Awwwwww yea!"
    end
end


puts is_valid_zip("20008-9007")
