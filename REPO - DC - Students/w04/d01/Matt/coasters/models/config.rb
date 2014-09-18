ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "matt",
  :password => "",
  :database => "coaster_db"
)

after do
  ActiveRecord::Base.connection.close
end
