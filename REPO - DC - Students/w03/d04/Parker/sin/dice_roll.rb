require 'sinatra'
require 'sinatra/reloader'

get '/dice_roll' do
	dice roll = [1, 2, 3, 4, 5]
	dice_roll = dice_roll.shuffle[0]
end