class DeliveryAddress < ActiveRecord::Base
  has_one :order
  has_one :customer, through: :order
  attr_accessible :directions
end
