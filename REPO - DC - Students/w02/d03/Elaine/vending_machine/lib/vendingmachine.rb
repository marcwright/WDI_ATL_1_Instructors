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

  def get_sku(number)
    selection = @inventory.find do |sku|
      number == sku.code
    end
    if selection == nil
      return nil
    else
      return selection
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
    @status = ''
  end

  def vend
    sku = get_sku(@code)

    if !sku
      @status = 'Please enter a valid code'
      @code = ''

    elsif sku.quantity <= 0
      @status = "Out of stock"
      @code = ''

    elsif sku.price > @credit
      @status = "Need more money"
    else
      sku.purchase
      @purchases.push(sku.product)
      @credit -= sku.price
    end
  end

end
