class VendingMachine
  attr_reader :status, :code, :credit, :change, :purchases

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
    return @inventory.find do |s|
     s.code == code
    end
  end

  def insert_cash(cash)
    @credit += cash
  end

  def enter_code(code)
    @code = code
  end

  def refund
    @change += @credit
    @credit = 0
    self.enter_code('')
    @status = ''
  end

  def vend
    sku = get_sku(@code)
    if sku == nil
      @status = "Please enter a valid code."
      enter_code("")

    elsif sku.quantity == 0
      @status = "Out of stock."
      enter_code("")
    elsif credit < sku.price
      @status = "Insufficient funds. Selected item costs $#{sku.price}"
    else
      sku.purchase
      @credit -= sku.price
      @change += @credit
      @credit = 0
      @purchases << sku.product
    end

  end
end
