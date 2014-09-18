require 'sinatra'
require 'sinatra/reloader'

yes_no = ["Do you have a test for that?", "Does the test pass?", "Need to refactor?"]

done = ["Write a test.", "Write just enough code for the test to pass.", "Refactor the code.", "Select a new feature to implement."]

get '/' do
  @have_test = yes_no[0]
  erb :index
end

get '/declarative/:number' do
  @done_index = params[:number].to_i
  @done_string = done[@done_index]
  erb :done
end

get '/interrogative/:number' do
  @yes_no_index = params[:number].to_i
  @next_index = @yes_no_index + 1
  @yes_no_string = yes_no[@yes_no_index]
  erb :yes_no
end

