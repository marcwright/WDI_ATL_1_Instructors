require 'pry'

class VendingMachine
  attr_reader :status, :code, :credit, :change, :purchases
  
  def initialize(inventory=[])
    @status = 'system functions nominal'
    @code = ''
    @credit = 0
    @change = 0
    @purchases = []
    @inventory = inventory
  end

  def get_sku(num)
    @inventory.find { |item| item.code == num}
  end


  def insert_cash(dollar_amount)
    new_amount = @credit + dollar_amount.to_f
    @credit = new_amount
  end


  def enter_code(input_code)
    @code = input_code
  end
 
  def refund
    change_amt = @credit
    @change += change_amt 
     @credit = 0
     @code = nil
     @status = nil
  end

  def vend
    sku = get_sku(@code)
    if !sku  #invalid sku code was entered in @code--get_sku couldn't use it
      @status = "invalid SKU code; choose again."
      @code = nil

    elsif @sku.quantity <= 0
      @status = "Item out of stock! Please choose again."
    

    elsif sku.price > @credit
    @status = "Need more credits"
    
    else 
      sku.purchase
    end

end








end