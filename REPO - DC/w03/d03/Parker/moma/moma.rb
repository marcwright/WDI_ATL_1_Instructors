require 'pg'
require 'active_record'
require 'pry'

ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "parkerhart",
  :password => "",
  :database => "moma_db"
)

class Artists < ActiveRecord::Base
    has_many :paintings, dependent
end

class Paintings < ActiveRecord::Base
    belongs_to :artists
end

binding.pry