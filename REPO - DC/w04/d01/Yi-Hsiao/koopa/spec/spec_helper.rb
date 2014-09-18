require_relative "../models/config"
require "rspec"
require "shoulda-matchers"
require "capybara/rspec"
require "database_cleaner"
require "pry"

RSpec.configure do |config|
  config.include Capybara::DSL
  config.order = 'random'

  DatabaseCleaner.strategy = :truncation

  # then, whenever you need to clean the DB
  config.after(:suite) do
    DatabaseCleaner.clean
  end
end
