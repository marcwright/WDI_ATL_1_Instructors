require 'sinatra'
require 'sinatra/reloader'

interrogative = [
"Do you have a test for that?", # [0]
"Does the test pass?",          # [1]
"Need to refactor?"             # [2]
]

declarative = [
  "Select a new feature",       # [0]
  "Write a test",               # [1]
  "Refactor the code",          # [2]
  "Write just enough code for the test to pass" # [3]
]

get '/' do 
  @question = "Do you have a test for that?"
  # yes_input = "/did-your-test-pass"
  # no_input  = "/write-test"
  erb :interrogative
end

get '/did-your-test-pass' do 
  @question = "Did your test pass?"
  # @yes_input = "/need-to-refactor"
  # @no_input  = "/just-enough-code"
  erb :interrogative
end

get '/write-test' do
  @action = "Write a test"
  # next_input = "/did-your-test-pass"
  erb :declarative
end

get '/need-to-refactor' do 
  @question = "Do you need to refactor?"
  erb :interrogative
end

get '/just-enough-code' do
  @action = "Write just enough code for the test to pass"
  erb :declarative
end
