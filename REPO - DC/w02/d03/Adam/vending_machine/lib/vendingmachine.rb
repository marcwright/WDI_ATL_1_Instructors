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
    @inventory.find do |sku|
      sku.code == code
    end
  end

  def insert_cash(cash)
    @credit += cash.to_f
  end

  def enter_code(code)
    @code = code
  end

  def refund
    @change += @credit
    @credit = 0
    @code = ''
  end

  def vend
    sku = get_sku(@code)

    if !sku
      @status = "invalud code"
      @code = ''
    elsif  sku.quantity <= 0
      @status = "out of stock"
    end
  end
end
