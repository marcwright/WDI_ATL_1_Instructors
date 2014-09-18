class Judge < ActiveRecord::Base
  has_many :scores
  has_many :episodes, through: :judgment
  belongs_to :judgment

  validates_presence_of :name, :profession, :nationality
  validates_numericality_of :age, only_integer: true

end
