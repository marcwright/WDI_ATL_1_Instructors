require "pry"
require_relative "sku"

class VendingMachine
  attr_reader :status, :code, :credit, :change, :purchases

  def initialize(inventory=[])
    @status = ""
    @code = ""
    @credit = 0
    @change = 0
    @purchases = []
    @inventory = inventory
  end

  def get_sku( code )
    @inventory.find { |sku| sku.code == code }
  end

  def insert_cash( cash )
    @credit += cash
  end

  def enter_code( code )
    @code = code
  end

  def refund
    @change += @credit
    @credit = 0
    @code = ""
    @status = ""
  end

  def vend
    req_prod = get_sku( @code ) # requested product

    if req_prod
      case
      when req_prod.quantity <= 0
        @status = "Sorry, #{ req_prod.product } is out of stock."
        @code = ""
      when req_prod.quantity > 0 && @credit < req_prod.price
        @status = "Sorry, you need #{ req_prod.price } to purchase a #{ req_prod.product }."
        @code = ""
      when req_prod.quantity > 0 && @credit >= req_prod.price
        req_prod.purchase
        @change = @credit - req_prod.price
        @credit = 0
        @purchases << req_prod.code
      end
    else
      @status = "Sorry, #{ @code } is not a valid code."
      @code = ""
    end
  end
end
