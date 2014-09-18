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

  def get_sku(code)
    return @inventory.find do |sku|
      sku.code == code
    end
  end

  def enter_code(code)
    @code = code
  end

  def insert_cash(cash)
    @credit += cash
  end

  def vend
    sku = get_sku(@code)

    if !sku
      @status = "Please enter a valid code"
      @code = ""
    elsif sku.quantity <= 0
      @status = "Item is out of stock"
      @code = ""
    elsif sku.price > @credit
      diff = sprintf("%0.2f", sku.price - @credit)
      @status = "Please insert an additional $#{diff}"
    else
      sku.purchase()
      @purchases.push(sku.product)
      @credit -= sku.price
      refund()
    end
  end

  def refund
    @change += @credit
    @credit = 0
    @code = ''
    @status = ''
  en