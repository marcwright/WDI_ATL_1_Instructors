require "active_record"

ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  hostname: "localhost",
  username: "yihsiaol",
  database: "calculator_db"
)

class Calculation < ActiveRecord::Base
  validates_presence_of :calculation
  validates_length_of :calculation, minimum: 3
end
