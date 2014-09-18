# Stephen Stanwood (stephen@stanwoodsolutions.com)

# CREATE TABLE chefs (
#   id SERIAL PRIMARY KEY,
#   name VARCHAR(100) NOT NULL,
#   alive_status BOOLEAN DEFAULT TRUE NOT NULL
# );

# CREATE TABLE rounds (
#   id SERIAL PRIMARY KEY,
#   food_type VARCHAR(100) NOT NULL
# );

# CREATE TABLE judges (
#   id SERIAL PRIMARY KEY,
#   name VARCHAR(100) NOT NULL
# );

# CREATE TABLE dishes (
#   id SERIAL PRIMARY KEY,
#   name VARCHAR(100) NOT NULL
# );

# CREATE TABLE scores (
#   id SERIAL PRIMARY KEY,
#   points INTEGER NOT NULL,
#   round_id INTEGER REFERENCES rounds(id),
#   dish_id INTEGER REFERENCES dishes(id),
#   judge_id INTEGER REFERENCES judges(id),
#   chef_id INTEGER REFERENCES chefs(id)
# );

require 'active_record'
require 'pry'

# Logger will print out the actual SQL that runs to the Terminal
ActiveRecord::Base.logger = Logger.new(STDOUT)

# require our code
Dir[File.join(File.dirname(__FILE__), 'chopped', '*.rb')].each {|file| require file }

# Connect to our postgres database for musicals
ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "stephenstanwood",
  :password => "",
  :database => "chopped_db")
