require "rspec"
require 'capybara/rspec'
require "pry"
require_relative "../lib/compliment_app"

RSpec.configure do |config|
  config.include Capybara::DSL
end
