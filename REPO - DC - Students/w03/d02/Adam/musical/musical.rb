require 'pg'
require 'active_record'
require 'pry'

ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "Adam",
  :password => "",
  :database => "musicals_db"
)

class Musical < ActiveRecord::Base
end

binding.pry
