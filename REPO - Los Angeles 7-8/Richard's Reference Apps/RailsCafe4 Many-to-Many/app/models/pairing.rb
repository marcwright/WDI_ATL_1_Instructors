class Pairing
  include Mongoid::Document
  belongs_to :bean
  belongs_to :pastry
end

