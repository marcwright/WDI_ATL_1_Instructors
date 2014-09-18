require 'pg'
require 'active_record'
require 'pry'

ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "elaine",
  :password => "",
  :database => "musicals_db"
)

class Musical < ActiveRecord::Base
  has_many :songs, dependent: :destroy
end

class Song < ActiveRecord::Base
  belongs_to :musical
end

class Character < ActiveRecord::Base
end

class Performance < ActiveRecord::Base
end

binding.pry
