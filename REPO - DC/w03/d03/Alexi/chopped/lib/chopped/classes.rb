

# Active Record Model
class Contestant < ActiveRecord::Base
  # Relationships
  has_many :dishes
  has_many :rounds, through: :dishes

  # Attributes
  validates :name, presence: true
end

class Dish < ActiveRecord::Base
  # Relationships
  belongs_to :contestant
  belongs_to :round
  # Attributes
  validates :dish_name, presence: true
  validates :chopped, inclusion: { in: [true, false] }
    # --> http://guides.rubyonrails.org/active_record_validations.html#presence
end

class Round < ActiveRecord::Base
  # Relationships 
  has_many :dishes
  has_many :contestants, through: :dishes
  has_many :ingredients
  # Attributes
  validates :title, presence: true
end

class Ingredient < ActiveRecord::Base 
  # Relationship
  belongs_to :round
  # Attributes
  validates :description, presence: true
end
