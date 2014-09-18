class Yahoo < DBBase

  attributes symbol: :string, object: :text
  attr_reader :created_at

  def self.table_name
    :yahoos
  end

  def self.for_symbol(symbol)
    symbol.upcase!
    result = run_sql("select * from yahoos where symbol = '#{symbol}'").first
    result ||= {'symbol' => symbol}
    yahoo = self.new(result)
    yahoo.object = Yahoo.quote(symbol) if yahoo.expired? || yahoo.as_object.empty?
    yahoo.save
    yahoo
  end

  def self.quote(symbol)
    quote = YahooFinance::get_standard_quotes(symbol)[symbol]
    hash = Hashie::Mash.new({ lastTrade: quote.lastTrade, name: quote.name })
  end

  def initialize(params={})
    @id = params['id']
    @symbol = params['symbol'].to_s.upcase
    @object = params['object'] || "{}"
    @created_at = Time.parse(params['created_at']) rescue nil
  end

  def as_object
    Hashie::Mash.new(JSON.parse(object))
  end

  def object=(yahoo)
    @created_at = Time.now
    @object = yahoo.to_json
  end

  def expired?
    created_at.nil? || created_at < Time.now - 300
  end

  def method_missing(method_name)
    as_object.send(method_name)
  end

end