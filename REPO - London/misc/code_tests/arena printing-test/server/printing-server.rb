require 'rubygems'
require 'sinatra'
require 'json'
require 'base64'


class OrderServer < Sinatra::Base
  # returns a load of order_ids that we will shortly need to print labels for
  get '/orders' do
    content_type :json
    {
      :order_ids => Array.new(5).fill(1000000).map{|e| rand(e) }
    }.to_json
  end

  # returns the json for a single order
  get '/order/:id' do
    content_type :json
    {
      :order_id => params[:id],
      :total_amount => 19.99,
      :currency => "GBP",
      :image => Base64.encode64(File.read(File.join(File.dirname(__FILE__), "card.jpg")))
    }.to_json
  end

  # marks an order as complete, so it is not sent again in the 'orders' action
  get '/order/completed/:id' do
    content_type :json
    {
      :order_id => params[:id],
      :status => "completed",
    }.to_json
  end
  
  
end
