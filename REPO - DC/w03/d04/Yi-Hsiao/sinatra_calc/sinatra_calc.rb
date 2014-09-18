require "sinatra"
require "sinatra/reloader"
require "slim"
require_relative "models/calculation"
require_relative "calc_history"
require_relative "calc_get_record"
require_relative "calc_operation"

get "/" do
  slim :index
end
