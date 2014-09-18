#require 'pg' pg is the postgres gem, don't need it if we are using active_record
require 'active_record'
require 'pry'

ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "admin",
  :password => "",
  :database => "moma_db"
)

class Artist < ActiveRecord::Base
  has_many :paintings, dependent: :destroy
end


class Painting < ActiveRecord::Base
  belongs_to :artist
end

binding.pry
