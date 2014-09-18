require 'pry'
class VendingMachine
  attr_reader :status, :code, :credit, :change, :purchases
  attr_writer :status, :code

  def initialize(inventory=[])
    @status = ''
    @code = ''
    @credit = 0
    @change = 0
    @purchases = []
    @inventory = inventory
  end

  def get_sku(code)
    @inventory.find {|sku|
      if sku.code == code
        return sku
      else
        return nil
      end}
  end

  def insert_cash(credit_amnt)
    @credit += credit_amnt
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
    if  sku == nil
      @status = "Please enter a valid code!"
      @code = ''
    elsif sku.quantity <= 0
      @status = "Out of Stock"
      @code = ''
    elsif sku.price > @credit
      @status = "Insert more $$"
    else
      sku.purchase
      @purchases.push(sku.price)
      @credit -= sku.price
    end
  end


  # Go...!
end
