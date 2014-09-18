#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-09 18:20:04
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-09 18:56:34

require "sinatra"
require "sinatra/reloader"

get "/" do
  @prompt = "Do you have a test for that?"
  @yes = "/pass"
  @no = "/write_test"
  erb :question
end

get "/pass" do
  @prompt = "Does the test pass?"
  @yes = "/refactor"
  @no = "/write_code"
  erb :question
end

get "/refactor" do
  @prompt = "Need to refactor?"
  @yes = "/do_refactor"
  @no = "/new_feature"
  erb :question
end

get "/write_test" do
  @prompt = "Write a test."
  @done = "/pass"
  erb :done
end

get "/write_code" do
  @prompt = "Write just enough code for that test to pass."
  @done = "/refactor"
  erb :done
end

get "/do_refactor" do
  @prompt = "Refactor the code."
  @done = "/pass"
  erb :done
end

get "/new_feature" do
  @prompt = "Select a new feature to implement."
  @done = "/"
  erb :done
end
