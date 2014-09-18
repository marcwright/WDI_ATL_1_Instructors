def make_change(cents)
  quarters = 0
  dimes = 0
  nickels = 0
  pennies = 0
  if cents >= 25
    quarters = cents / 25
    cents -= quarters * 25
  end
  if cents >= 10
    dimes = cents / 10
    cents -= dimes * 10
  end
  if cents >= 5
    nickels = cents / 5
    cents -= nickels * 5
  end
  if cents >= 1
    pennies = cents
  end
  return "#{quarters} quarters, #{dimes} dimes, #{nickels} nickels, #{pennies} pennies"
end
