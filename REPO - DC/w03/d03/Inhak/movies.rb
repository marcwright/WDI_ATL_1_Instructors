require 'pg'
require 'active_record'
require 'pry'

#logs what the sql that it is, logs to the terminal.
ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "inhak",
  :password => "",
  :database => "movies_db"
)

class Movie < ActiveRecord::Base
  has_many :roles
  has_many :actors, :through => :roles
end

class Actor < ActiveRecord::Base
  has_many :roles
  has_many :movies, :through => :roles
end

class Role < ActiveRecord::Base
  belongs_to :actor
  belongs_to :movie
end

binding.pry
