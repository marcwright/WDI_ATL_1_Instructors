ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "mhipp",
  :password => '',
  :database => "koopas_db"
  )

after do
  ActiveRecord::Base.connection.close
end
