class Round < ActiveRecord::Base
  has_many :dishes
  has_many :chefs, through: :dishes


  validates :course,
    presence: true,
    inclusion: {
      in: %w(appetizer entree dessert)
    }

end
