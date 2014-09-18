require 'active_record'
require 'pry'

# Active Record connection
ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :user => "mhipp",
  :password => "",
  :database => "roles"
  )

class Actor < ActiveRecord::Base
  has_many :roles
  has_many :movies, :through => :roles
end

class Movie < ActiveRecord::Base
  has_many :roles
  has_many :actors, :through => :roles
end

class Role < ActiveRecord::Base
  belongs_to :actor
  belongs_to :movie
end

binding.pry
