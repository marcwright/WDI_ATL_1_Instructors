require 'pg'
require 'active_record'
require 'pry'

# this will log what the SQL is for educational purposes
ActiveRecord::Base.logger = Logger.new(STDOUT)

# Active Record connection
ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :user => "mhipp",
  :password => "",
  :database => "musicals_db"
  )

class Musical < ActiveRecord::Base
  has_many :songs
end

class Song < ActiveRecord::Base
  belongs_to :musical
end

binding.pry

