require_relative './models/robot'
require_relative './models/protocol'
require_relative './models/bender'

robo = Robot.new
puts robo.speak

c3po = ProtocolDroid.new
puts c3po.speak

bender = Bender.new
puts bender.speak