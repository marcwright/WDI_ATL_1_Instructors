require_relative './robot'
require_relative './protocol'
require_relative './bender'

robo = Robot.new
puts robo.speak

c3po = ProtocolDroid.new
puts c3po.speak

bender = Bender.new
puts bender.speak