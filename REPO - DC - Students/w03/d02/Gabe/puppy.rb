require 'active record'
require 'pry'

ActiveRecord::Base.establish_connection("postrgres://localhost/puppy")

class Puppy < ActiveRecord::Base

  validates: name,
    presence: true,
    length : {minimum: 3}
  validates: age,
    numericality: {
      less_than_or_equal_to: 1
      message: "Is too old to be a puppy. That's a dog."
    }
  validate :name_cuteness #makes a new validates method here, called name_cuteness.
  if name[-1] != y && name[-2..-1] !="ie" #name must end in y or ie.
    errors.add(:name_cuteness, "is not sufficiently cute.")
