class Portfolio < DBBase

  attributes name: :string,
              description: :text,
              category_id: :integer

  def self.table_name
    :portfolios
  end

  def initialize(params={})
    @id = params['id']
    @name = params['name']
    @description = params['description']
    @category_id = params['category_id']
  end

  def category
    @category ||= Category.find(category_id)
  end

  def stocks
    return @stocks if @stocks
    results = run_sql("select * from stocks where portfolio_id = #{id}")
    @stocks = results.map { |result| Stock.new(result) }
  end

  def value
    stocks.reduce(0) { |sum, stock| sum += stock.value }
  end

end














