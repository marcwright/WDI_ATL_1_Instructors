require 'sinatra'
require 'sinatra/reloader'


questions = [
  "Do you have a test for that?",
  "Write a test for it.",
  "Does the test pass?",
  "Write just enough for it to pass.",
  "Do you need to refactor?",
  "Refactor the code.",
  "Select a new feature to implement."
]

get '/' do
    @position = 0
    @yes = @position += 2
    @no = @position += 1
    erb :index
end

get '/yesno/:questionnum' do
  #this is getting current position in array
  @position = params[:questionnum].to_i
  #this is getting question text
  @question = questions[@position]

    if @position < 4
      @yes = @position += 2
      @no = @position += 1

    elsif @position == 4
      @yes = @position += 1
      erb :done
      @no = @position += 2
      erb :yesno

    elsif @position == 5
      @done = @position += 1
      erb :done
    else
      redirect '/'
    end
    erb :yesno
end

get '/done/:questionnum' do
  #this is getting current position in array
  @position = params[:questionnum].to_i
  #this is getting question text
  @question = questions[@position]
  @done = @position + 1
  erb :done
end




