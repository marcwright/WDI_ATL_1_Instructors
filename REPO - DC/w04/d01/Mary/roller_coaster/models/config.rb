ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "mhipp",
  :password => '',
  :database => "roller_coasters_db"
  )

after do
  ActiveRecord::Base.connection.close
end
