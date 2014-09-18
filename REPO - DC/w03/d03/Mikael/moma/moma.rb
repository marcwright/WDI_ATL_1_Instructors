require 'pg'
require 'pry'
require 'active_record'

ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "postgres",
  :password => " ",
  :database => "moma_db"
)


class Artist < ActiveRecord::Base
  has_many :paintings, dependent: :destroy
end

class Painting < ActiveRecord::Base
  belongs_to :artist
end

# binding.pry
