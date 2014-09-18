require "pry"
require "active_record"

ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  host: "localhost",
  user: "yihsiaol",
  database: "actor_db"
)

class Actor < ActiveRecord::Base
  has_many :movies, through: :movies
end

class Movie < ActiveRecord::Base
  has_many :actors, through: :roles
end

class Role < ActiveRecord::Base
  belongs_to :actor
  belongs_to :movie
end

# binding.pry
