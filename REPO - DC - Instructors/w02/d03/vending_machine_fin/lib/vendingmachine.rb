class VendingMachine
  attr_reader :status, :selection, :credit, :change, :purchases
  
  def initialize(products=[])
    @status = ''
    @selection = ''
    @credit = 0
    @change = 0
    @purchases = []
    @products = products
  end

  def get_product(code)
    return @products.find do |product|
      product.code == code
    end
  end

  def insert_cash(cash)
    @credit += cash
    vend()
  end
  
  def enter_selection_digit(digit)
    if @selection.length < 2
      @selection += digit
    end

    if @selection.length == 2

    end
  end

  def vend
    product = get_product(@selection)

    if !product
      @status = "Please enter a valid code"
      @selection = ""
    elsif product.quantity <= 0
      @status = "Item is out of stock"
      @selection = ""
    elsif product.price > @credit
      diff = sprintf("%0.2f", product.price - @credit)
      @status = "Please insert an additional $#{diff}"
    else
      product.purchase()
      @purchases.push(product.name)
      @credit -= product.price
      refund()
    end
  end

  def refund
    @change += @credit
    @credit = 0
    @selection = ''
    @status = ''
  end
end