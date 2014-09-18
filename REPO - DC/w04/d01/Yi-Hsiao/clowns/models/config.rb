require "active_record"

ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  hostname: "localhost",
  username: "yihsiaol",
  database: "clown_db"
)
