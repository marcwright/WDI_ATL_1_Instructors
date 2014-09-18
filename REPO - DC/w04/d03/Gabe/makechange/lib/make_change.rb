

  def make_change(cents)
    @cents = cents

  quarters = cents / 25
  dimes = (cents - (quarters * 25))/ 10
  nickels = ((cents - (quarters * 25)) - (dimes * 10)) / 5
  pennies = (((cents - (quarters * 25)) - (dimes * 10)) - (nickels * 5)) / 1

  return "quarters: #{quarters} dimes: #{dimes} nickels: #{nickels} pennies: #{pennies}"

  end




puts make_change(76)
