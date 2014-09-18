change = []

require "pry"
def make_change(cents, array)

  if cents > 25
    #make it so each value of 25 pushes something called "quarter" into an array
    num_of_quarters = (cents/25).floor
    num_of_quarters.times do
      array.push("quarter")
      cents = cents - num_of_quarters(25)
    end

  end
end
binding.pry
