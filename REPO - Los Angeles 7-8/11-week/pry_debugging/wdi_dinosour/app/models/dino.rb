class Dino
  include Mongoid::Document
  field :name, type: String
  field :era, type: String
  field :weight, type: Float
  field :horns, type: Integer
  field :diet, type: String
end
