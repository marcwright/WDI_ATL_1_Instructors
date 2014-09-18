class Place
  include Mongoid::Document
  field :latitude, type: String
  field :longitude, type: String
  field :description, type: String
  field :title, type: String
end
