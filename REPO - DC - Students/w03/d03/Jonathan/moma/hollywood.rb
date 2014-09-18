require 'active_record'
require 'pry'

ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "JEMBP",
  :password => "",
  :database => "hollywood_db"
)

class Actor < ActiveRecord::Base
  has_many :roles
  has_many :movies, :through => :roles
end

class Role < ActiveRecord::Base
  belongs_to :actor
  belongs_to :movie
end

class Movie < ActiveRecord::Base
  has_many :roles
  has_many :actors, :through => :roles
end


binding.pry
