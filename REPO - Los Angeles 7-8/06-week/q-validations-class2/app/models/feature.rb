class Feature
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :difficulty, type: Integer

  validates_presence_of :name
  validates_presence_of :description
  validates_numericality_of :difficulty, only_integer: true


  validates_inclusion_of :difficulty,
  	in: [1,2,3,4,5]


end