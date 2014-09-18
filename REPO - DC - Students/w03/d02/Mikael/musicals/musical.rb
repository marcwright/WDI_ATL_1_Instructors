require 'pg'
require 'active_record'
require 'pry'

ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "postgres",
  :password => "M4GN3Th1gh8",
  :database => "musicals_db"
)

class Musical < ActiveRecord::Base
  has_many :songs, dependent: :destroy
end

class Song < ActiveRecord::Base
  belongs_to :musical
end


# binding.pry
