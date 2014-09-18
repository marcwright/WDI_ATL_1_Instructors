require "active_record"

ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  host: "localhost",
  username: "yihsiaol",
  database: "moma_db"
)

class Artist < ActiveRecord::Base
  has_many :paintings
end

class Painting < ActiveRecord::Base
  belongs_to :artist
end
