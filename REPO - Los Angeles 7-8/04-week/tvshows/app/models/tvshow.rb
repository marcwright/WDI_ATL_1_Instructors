class Tvshow
  include Mongoid::Document
  field :name, type: String
  field :network, type: String
  field :seasons, type: Integer
  field :premier, type: Date
end
