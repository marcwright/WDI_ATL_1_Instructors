require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require_relative 'models/db_base'
require_relative 'models/portfolio'
require_relative 'models/category'
require_relative 'models/stock'
require_relative 'controllers/portfolios_controller'
require_relative 'controllers/stocks_controller'
require_relative 'controllers/categories_controller'


before do
  DBBase
end


get '/' do
  erb :home
end

