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
    return @inventory.find {|sku| sku.code.include? code}
  end

  def insert_cash(credit)
    @credit += credit
  end

  def enter_code(code)
    @code = code
  end

  def refund(credit, purchases)
    puts "You're being refunded #{@credit}"
    @change = credit - purchases
    @credit = 0
    @code = ''
    @status = ''
  end

  def vend

    sku = get_sku(@code)

    if sku == nil
      @status = "Code is invalid, try another."
      @code = ''
    elsif
      sku.quantity <= 0
      @status = "Item is out of stock."
      @code = ''
    elsif
      sku.price > @credit
      @status = "gimme mas mula"
    else
      sku.purchase
      @purchases.push(sku.product)
      @credit -= price
      sku.refund
    end
  end
end


