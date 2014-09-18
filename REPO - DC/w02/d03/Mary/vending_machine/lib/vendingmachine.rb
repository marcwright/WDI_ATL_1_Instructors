class VendingMachine
  attr_reader :status, :code, :credit, :change, :purchases, :inventory
  attr_writer :credit, :change, :code, :purchases

  def initialize(inventory=[])
    @status = ''
    @code = ''
    @credit = 0
    @change = 0
    @purchases = []
    @inventory = inventory
  end

  def get_sku(code)
    @inventory.find do |sku|
      sku.code == code
    end
  end

  def insert_cash(amount)
    @credit += amount
  end

  def enter_code(code)
    @code = code
  end

  def refund
    @change += @credit
    @credit = 0
    @code = nil
    @status = ""
  end

  def vend
    sku = get_sku(@code)
    if sku == nil
      @code = nil
      @status = "Please enter a valid code."
    elsif sku.quantity < 1
      @code = nil
      @status = "This product is out of stock."
    elsif sku.price > @credit
      @status = "Insufficient credit; please insert additional funds in amount of #{sku.price - @credit}."
    else
      sku.purchase
      sku.quantity -= 1
      @credit -= sku.price
      purchases.push(sku.product)
    end

  end

end
