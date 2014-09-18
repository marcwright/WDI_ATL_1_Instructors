
get '/portfolios/:portfolio_id/stocks/new' do
  @stock = Stock.new
  @portfolio = Portfolio.find(params[:portfolio_id])
  erb :'stocks/new'
end

post '/portfolios/:portfolio_id/stocks' do
  @stock = Stock.new(params[:stock])
  @stock.portfolio_id = params['portfolio_id']
  @stock.update_from_yahoo
  @stock.save

  redirect to("/portfolios/#{params['portfolio_id']}")
end

get '/portfolios/:portfolio_id/stocks/:id/edit' do
  @stock = Stock.find(params[:id])
  @portfolio = Portfolio.find(params[:portfolio_id])
  erb :'stocks/edit'
end

post '/portfolios/:portfolio_id/stocks/:id' do
  @stock = Stock.find(params[:id].to_i)
  @stock.update_attributes(params[:stock])
  @stock.update_from_yahoo
  @stock.save
  redirect to("/portfolios/#{params['portfolio_id']}")
end

get '/portfolios/:portfolio_id/stocks/:id/delete' do
  Stock.find(params[:id]).destroy
  redirect to("/portfolios/#{params['portfolio_id']}")
end






















