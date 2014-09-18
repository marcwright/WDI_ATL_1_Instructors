class Stock < DBBase
  attributes name: :string
  attr_accessor :recipes

  def self.table_name
    :stocks
  end

  def initialize(params={})
    @id = params['id']
    @name = params['name']
    @portfolio_id = params['portfolio_id']
    @portfolio = Portfolio.find(portfolio_id)
  end

end
