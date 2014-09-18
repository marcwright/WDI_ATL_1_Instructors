class VendingMachine
  attr_reader :status, :code, :credit, :change, :purchases, :inventory

  def initialize(inventory=[])
    @status = ''
    @code = ''
    @credit = 0
    @change = 0
    @purchases = []
    @inventory = inventory
  end

  # Go...!
  def get_sku(code)
    inventory.find do |s|
      code == s.code
    end
  end

  def insert_cash(amount)
    @credit += amount.to_i
  end

  def enter_code(code)
    @code = code
  end

  def refund
    @change += @credit
    @credit = 0
    @code = ''
    @status = ''
  end

  def vend
    sku = get_sku(@code)
    if !sku
      @status = "Invalid Code"
      @code = ''
    elsif sku.quantity <= 0
      @status = "Out of stock."
      @code = ''
    elsif sku.price > @credit
      @status = "Insufficient funds, please insert cash."
      required_cash_amount = sku.price - @credit
      @status += " Please insert $#{required_cash_amount}."
    else
      sku.purchase
      @purchase.push(sku.product)

    end
  end

end
