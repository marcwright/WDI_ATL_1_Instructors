# require libraries
require 'pry'
# require 'active_record'

# # require our code
# Dir[File.join(File.dirname(__FILE__), 'energy', '*.rb')].each {|file| require file }

# # Configure Active Record
# # ActiveRecord::Base.logger = Logger.new(STDOUT)

# ActiveRecord::Base.establish_connection(
#   :adapter => "postgresql",
#   :host => "localhost",
#   :username => "matt",
#   :password => "",
#   :database => "energy"
# )

class Student

  attr_reader :name, :energy, :brain
  attr_accessor :brain, :energy

  def initialize(name)
    @name = name
    @energy = 100
    @brain = 0
  end

  def code
    @brain += 1
    @energy -= 1

    if @energy < 20
      puts "You need a break guy"
      return false
    end
  end

  def break
    @energy += 1
  end

end
