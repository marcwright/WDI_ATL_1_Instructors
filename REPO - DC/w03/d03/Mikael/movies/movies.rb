require 'pg'
require 'pry'
require 'active_record'

ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "postgres",
  :password => " ",
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
  belongs_to :movie
  belongs_to :actor
end

binding.pry
