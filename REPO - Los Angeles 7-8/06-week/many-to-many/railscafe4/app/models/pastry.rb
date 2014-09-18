class Pastry
  include Mongoid::Document
  field :name, type: String
  field :type, type: String
  field :price, type: Float
  has_many :pairings
end


