require "rspec"
require "capybara/rspec"
require "pry"
require_relative "helpers/shared_examples"

RSpec.configure do |config|
  config.include Capybara::DSL
end
