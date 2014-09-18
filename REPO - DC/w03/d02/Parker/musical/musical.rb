require 'pg'
require 'active_record'
require 'pry'

ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "parkerhart",
  :password => "",
  :database => "musicals_db"
)

class Musical < ActiveRecord::Base
	has_many :songs, dependent: :destroy
end

class Song < ActiveRecord::Base
	belongs_to :musical
	has_many :performances
end

class Character < ActiveRecord::Base
	has_many :performances
	has_many =:performances
end

class Performance < ActiveRecord::Base
	belongs_to :song
	belongs_to :character
end

binding.pry