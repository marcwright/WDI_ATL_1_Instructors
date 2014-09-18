require 'pry-byebug'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'

get '/' do
  redirect to('/items')
end

get '/items' do

  conn = PG.connect(:dbname =>'todo', :host => 'localhost')
  begin
    @items = conn.exec("select * from items")
  ensure
    conn.close
  end

  # NOTE: it's better to not connect to the DB in every action, so abstract it to a method, and use that instead
  
  # sql = "select * from items"

  # @items = run_sql(sql)
  erb :index
end

get '/items/new' do
  erb :new
end

post '/items' do
  item = params[:item]
  details = params[:details]
  sql = "insert into items (item, details) values ('#{item}', '#{details}')"
  run_sql(sql)
  redirect to('/items')
end

get '/items/:id' do
  sql = "select * from items where id = #{params[:id]}"
  @item = run_sql(sql).first
  erb :show
end

get '/items/:id/edit' do
  sql = "select * from items where id = #{params[:id]}"
  @item = run_sql(sql).first
  erb :edit
end

post '/items/:id' do
  item = params[:item]
  details = params[:details]
  sql = "update items set item='#{item}', details='#{details}' where id=#{params[:id]}"
  run_sql(sql)
  redirect to("/items/#{params[:id]}")
end

get '/items/:id/delete' do
  sql = "delete from items where id = #{params[:id]}"
  run_sql(sql)
  redirect to('/items')
end

private
def run_sql(sql)
  conn = PG.connect(:dbname =>'todo', :host => 'localhost')
  begin
    result = conn.exec(sql)
  ensure
    conn.close
  end

  result
end
