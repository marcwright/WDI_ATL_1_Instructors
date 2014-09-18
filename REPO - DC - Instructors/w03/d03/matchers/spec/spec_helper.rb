require_relative '../lib/musical'

require "shoulda-matchers"
require "database_cleaner"

RSpec.configure do |config|
  I18n.enforce_available_locales = false

  DatabaseCleaner.strategy = :truncation

  # then, whenever you need to clean the DB
  config.after(:suite) do
    DatabaseCleaner.clean
  end
end
