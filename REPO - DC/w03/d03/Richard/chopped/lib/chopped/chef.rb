class Chef < ActiveRecord::Base
  belongs_to :episode
  has_many :dishes

  validates_presence_of :name, :home_town
  validates_numericality_of :age, only_integer: true
  validates_inclusion_of :gender, in: %w(m f)
end

