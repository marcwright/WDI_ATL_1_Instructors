require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get '/rps/rock/:user_choice' do
  computer = ["rock", "paper", "scissor"]
  results = {:rock => "paper", :paper => "scissor", :scissor => "rock"}
    if results[params[:user_choice]] == "computer.sample"
      "The computer chose #{computer.sample}. You lose."
    # elsif results[params[:user_choice]] != "computer.sample"
    #   "The computer chose #{computer.sample}. You win!"
    # else
    #   "The computer chose #{computer.sample}. Its a tie!"
    end
end
