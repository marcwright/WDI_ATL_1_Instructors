class Stock < DBBase

  attributes name: :string,
              symbol: :string,
              buying_price: :decimal,
              holding: :integer,
              portfolio_id: :integer

  def self.table_name
    :stocks
  end

  def initialize(params={})
    @id = params['id']
    @name = params['name']
    @symbol = params['symbol']
    @buying_price = params['buying_price']
    @holding = params['holding']
    @portfolio_id = params['portfolio_id']
  end

  def symbol
    self.symbol = @symbol.to_s.upcase
  end

  def portfolio
    @portfolio ||= Portfolio.find(portfolio_id)
  end

  def update_from_yahoo
    if yahoo_object
      @buying_price ||= yahoo_object.lastTrade.to_f
      @name = yahoo_object.name
    end
  end

  def current_price
    @current_price ||= (yahoo_object.lastTrade.to_f if yahoo_object)
  end

  def value
    self.holding.to_i * self.current_price.to_f
  end

  def yahoo_object
    @yahoo_object ||= Yahoo.for_symbol(symbol)
  end





end














