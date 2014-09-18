ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "peterlai",
  :password => "",
  :database => "sandbox"
)

after do
  ActiveRecord::Base.connection.close
end