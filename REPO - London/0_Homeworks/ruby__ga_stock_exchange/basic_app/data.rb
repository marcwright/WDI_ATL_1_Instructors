require_relative 'brokerage'

def setup_brokerage_data(brokerage)
  brokerage.add_client('Bob', 50_000)
  brokerage.add_client('Sue', 120_000)
  brokerage.add_client('Jil', 99_000)

  brokerage.client('Bob').create_portfolio('Tech')
  brokerage.client('Bob').create_portfolio('Energy')
  brokerage.client('Bob').create_portfolio('Fashion')
  brokerage.client('Sue').create_portfolio('Finance')
  brokerage.client('Sue').create_portfolio('Medical')
  brokerage.client('Jil').create_portfolio('Retail')

  brokerage.client('Bob').add_stock_to_portfolio('Tech', 'AAPL', 10, 14.22)
  brokerage.client('Bob').add_stock_to_portfolio('Tech', 'GOOG', 5, 35.35)
  brokerage.client('Bob').add_stock_to_portfolio('Tech', 'AMZN', 3, 2.50)
  brokerage.client('Bob').add_stock_to_portfolio('Tech', 'MSFT', 18, 22.10)
  brokerage.client('Bob').add_stock_to_portfolio('Energy', 'GE', 10, 8.63)
  brokerage.client('Bob').add_stock_to_portfolio('Energy', 'FLWS', 7, 3.22)
  brokerage.client('Bob').add_stock_to_portfolio('Fashion', 'FCCY', 9, 0.44)
  brokerage.client('Sue').add_stock_to_portfolio('Finance', 'VNET', 12, 8.32)
  brokerage.client('Sue').add_stock_to_portfolio('Medical', 'JOBS', 11, 9.12)
  brokerage.client('Jil').add_stock_to_portfolio('Retail', 'EGHT', 4, 2.10)
  brokerage.client('Jil').add_stock_to_portfolio('Retail', 'AAON', 8, 4.56)
end