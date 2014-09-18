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
    @code = nil
    @status = nil
  end

  def vend
    sku = get_sku(@code)

    if !sku
      @status = "input valid code"
      @code = ""
    #elsif sku.quantity = 0

    end

  end

end
