class Contestant < ActiveRecord::Base
  has_many :dishes
  has_many :rounds, through: :dishes

  validates :name, presence: true
end

class Round < ActiveRecord::Base
  has_many :dishes
  has_many :ingredients
  has_many :contestants, through: :dishes

  validates :level, presence: true
end

class Dish < ActiveRecord::Base
  belongs_to :round
  belongs_to :contestant

  # validates_inclusion_of :chopped, :in => [ true, false ]
end

class Ingredient < ActiveRecord::Base
  belongs_to :round
end
