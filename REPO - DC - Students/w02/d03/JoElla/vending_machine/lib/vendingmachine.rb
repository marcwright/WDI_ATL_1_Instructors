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
    @inventory.find do |item|
      item.code == code
    end
  end

  def insert_cash(amount)
    @credit += amount
  end

  def enter_code(code)
    @code = code
  end

  def refund
    @change = @credit + @change
    @credit = 0
    enter_code("")
    @status = ""
  end

  def vend
    sku = get_sku(@code)

    if !sku
      @status = "Invalid"
      @code = ""
    end
  end


end
