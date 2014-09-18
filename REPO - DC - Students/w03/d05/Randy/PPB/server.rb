require 'sinatra'
require 'sinatra/reloader'






get '/' do
  redirect '/yes_no/0'
end

get '/yes_no/:num' do
  @yes_no_ques_array = ["You got a test for that?", "Let me axe you another question, does that test of yours pass?", "Do you need to refactor? Don't lie to me!!"]
  @number = params[:num].to_i
  erb :yes_no
end


get '/done/:num' do
  @done_ques_array = ["Wha!!??! Write a test!", "Your inferior human intellect means you should proabably just write enough code to make the test pass.", "I'm Proud of you meatbag! Why don't you try to implement a new feature while I decide whether or not to destroy all humans.", "Do it alllreeaaddyyyy!!!"]
  @number = params[:num].to_i
  erb :done
end
















# get '/' do
#   erb :start
# end

# get '/pass' do
#   erb :pass
# end

# get '/write_a_test' do
#   erb :write_a_test
# end

# get '/pass' do
#   erb :pass
# end

# get '/enough_to_pass' do
#   erb :enough_to_pass
# end

# get '/refactor' do
#   erb :refactor
# end

# get '/new_feature' do
#   erb :new_feature
# end

# get '/do_it' do
#   erb :do_it
# end
