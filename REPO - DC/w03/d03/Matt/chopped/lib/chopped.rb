<<<<<<< HEAD
require "pg"
require "active_record"
require "pry"

# require our code
Dir[File.join(File.dirname(__FILE__), 'chopped', '*.rb')].each {|file| require file }

ActiveRecord::Base.logger = Logger.new(STDOUT)
=======
# require libraries
require 'pry'
require 'active_record'

# require our code
Dir[File.join(File.dirname(__FILE__), 'chopped', '*.rb')].each {|file| require file } 

# Configure Active Record
# ActiveRecord::Base.logger = Logger.new(STDOUT)
>>>>>>> 6d9b2704dc3fc6afc5ca02cd897756bc9cc2ad82

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
<<<<<<< HEAD
  :username => "matt",
  :password => "",
  :database => "chopped_db"
  )

binding.pry
=======
  :username => "peterlai",
  :password => "",
  :database => "chopped"
)
>>>>>>> 6d9b2704dc3fc6afc5ca02cd897756bc9cc2ad82
