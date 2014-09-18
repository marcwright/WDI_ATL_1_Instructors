require 'pg'
require 'active_record'
require 'pry'

ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "sdoshi_3",
  :password => "",
  :database => "movie_db"
  )

class Movie < ActiveRecord::Base
  has_many :roles
  has_many :actors, :through => :roles
end

class Actor < ActiveRecord::Base
  has_many :movie, :through => :roles
  has_many :roles
end

class Role < ActiveRecord::Base
  belongs_to :movie
  belongs_to :actor
end

binding.pry
