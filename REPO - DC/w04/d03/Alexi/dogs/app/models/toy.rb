class Toy < ActiveRecord::Base
  belongs_to :dog
  has_many :toys


end
