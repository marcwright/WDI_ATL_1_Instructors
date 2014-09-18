require 'pg'
require 'active_record'
require 'pry'

ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "gabe",
  :password => "",
  :database => "moma_db"
)

class Artist < ActiveRecord::Base
    has_many :painting, dependent: :destroy
end

class Painting < ActiveRecord::Base
    belongs_to :artist
end

#binding.pry
