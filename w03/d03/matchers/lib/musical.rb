require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "peterlai",
  :password => "",
  :database => "musicals_db"
)

class Musical < ActiveRecord::Base
  validates_presence_of :composer
end