require 'pry'

class Person
  @@toe_count = 10
  
  def toe_count=(value)
    @@toe_count=value
  end

  def toe_count
    @@toe_count
  end

end

binding.pry
