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
    @change = @credit
    @credit = 0
  end

end # - E N D Class
