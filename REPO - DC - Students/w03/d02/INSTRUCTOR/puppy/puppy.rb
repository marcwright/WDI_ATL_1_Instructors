require 'active_record'
require 'pry'

I18n.enforce_available_locales = false
$connection = ActiveRecord::Base.establish_connection("postgres://localhost/puppy")

class Puppy < ActiveRecord::Base

<<<<<<< HEAD
  validates :name,
    presence: true,
    length: { minimum: 3}

  validates :age,
    numericality: {
      less_than_or_equal_to: 1,
      message: "is too old to be a puppy, that's a dog."
    }

    validate :name_cuteness

    def name_cuteness
      if name[-1] != "y" && name[-2..-1] != "ie"
        errors.add(:name_cuteness, "is not sufficiently cute")
      end
    end
=======
  validates :age,
    numericality: {
      less_than_or_equal_to: 1
      message: "is too old to be a puppy, that's a dog."
    }

  validates :name,
    presence: true,
    length: { minimum: 3 }

  validate :name_cuteness
  def name_cuteness
    if name[-1] != "y" && name[-2..-1] != "ie"
      errors.add(:name_cuteness, "is not sufficiently cute")
    end
  end
>>>>>>> 7dbe8a19bb4a5fd96235765e6c67294ed1926724
end

binding.pry
