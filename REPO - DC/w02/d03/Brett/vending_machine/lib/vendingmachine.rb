class VendingMachine
  attr_reader :status, :code, :credit, :change, :purchases, :inventory
  attr_accessor :purchases

  def initialize(inventory=[])
    @status = ""
    @code = ""
    @credit = 0
    @change = 0
    @purchases = []
    @inventory = inventory
  end

  def get_sku(code)
    return inventory[code.to_i - 1] # This won't work if a string like "Brett" is entered.
  end

  def insert_cash!(cash)
    @credit += cash
  end

  def enter_code!(user_code)
    @code = user_code
  end

  def refund!
    @change += credit
    @credit = 0
    @code = ""
    @status = ""
  end

  def vend!
    if get_sku(@code) == nil
      @status = "Please enter valid code"
      @code = ""
    elsif get_sku(@code).quantity == 0
      @status = "Out of stock"
      @code = ""
    elsif @credit < get_sku(@code).price
      @status = "Insufficient credit. Item costs $#{get_sku(@code).price}"
    else
      get_sku(@code).purchase!
      @credit -= get_sku(@code).price
      @purchases << get_sku(@code).product
    end
  end

end
