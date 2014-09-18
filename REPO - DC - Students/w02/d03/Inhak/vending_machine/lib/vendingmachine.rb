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
    @inventory.find { |sku| sku.code == code}
  end
  # Go...!

  def insert_cash(cash)
    @credit += cash.to_f
  end

  def enter_code(code)
    @code = code
  end

  def refund
    @change += @credit
    @credit = 0
    @code = ""
    @status = ""
  end

  def vend
    sku = get_sku(@code)

    if !sku
      @status = "Invalid Code"
      @code = ""
    elsif sku.quantity <= 0
      @status = "out of stock"
      @code = ""
    elsif sku.price > credit
      @status = "Need more money"
      @code = ""
    else
      sku.purchase
      @purchases.push(sku.product)
      @credit -= price
      refund
    end

  end

end
