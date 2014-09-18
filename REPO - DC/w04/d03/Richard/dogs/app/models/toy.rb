class Toy < ActiveRecord::Base
  #setting a foreign key for Toy to Dog
  belongs_to :dog

end
