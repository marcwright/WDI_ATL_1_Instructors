require 'sinatra'
require 'sinatra/reloader'


get '/' do
   erb :test_for_that
end

get '/pass' do
   erb :test_pass
end

get '/write_test' do
   erb :write_test
end

get '/refactor' do
   erb :need_refactor
end

get '/write_code' do
   erb :write_enough
end

get '/do_refactor' do
   erb :refactor_the_code
end

get '/new_feature' do
   erb :select_new_feature
end


