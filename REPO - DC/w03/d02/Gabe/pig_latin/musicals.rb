require 'pg'
require 'active_record'
require 'pry'

ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Base.establish_connection(
	:adapter => "postgresql",
	:host => "localhost",
	:username => "gabe",
	:password => "",
	:database => "misc")

class Musical < ActiveRecord::Base
end


binding.pry

