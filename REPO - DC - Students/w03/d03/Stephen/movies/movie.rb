# Stephen Stanwood (stephen@stanwoodsolutions.com)

require 'active_record'
require 'pry'

# Logger will print out the actual SQL that runs to the Terminal
ActiveRecord::Base.logger = Logger.new(STDOUT)

# Connect to our postgres database for musicals
ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "stephenstanwood",
  :password => "",
  :database => "movies_db")

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

Movie.create
