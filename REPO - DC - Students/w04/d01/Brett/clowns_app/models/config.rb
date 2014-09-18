ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  hostname: "localhost",
  username: "BYWallace",
  database: "clowns_db"
  )

# after do
#   ActiveRecord::Base.connection.close
# end
