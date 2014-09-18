class VendingMachine
  attr_reader :status, :code, :credit, :change, :purchases
  attr_writer :status

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
    @inventory.find do |sku|
      sku.code == code
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
    @code = ''
    @status = ''
  end

  def vend
    sku = get_sku(@code)

    if !sku
      @status = 'invalid'
      @code = ''
    elsif sku.quantity <= 0
      @status = 'out of stock'
      @code = ''
    elsif sku.price >= @credit
      @status = 'not enough money'
      @status = sku.price
    else
      sku.purchase
      @purchases -= sku.price
      refund()
    end
  end
end
