class Koopa < ActiveRecord::Base
   def to_s
     return "#{name} is #{color} and #{has_shell ? "has a shell" : "does not have a shell"}!"
   end
end
