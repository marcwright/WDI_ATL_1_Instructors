
  def make_change(cents)
    change = ""
    quarter = " quarter" * (cents / 25)
    dime = quarter + (" dime" * (cents / 25))
    nickel = dime + (" nickel" * (cents/25))
    penny = nickel + (" penny" * (cents/25))
    # change = change + " nickel" * (cents % 10/5)
    # change = change + " penny" * (cents % 5/1)
    return penny
  end

puts make_change(44)
