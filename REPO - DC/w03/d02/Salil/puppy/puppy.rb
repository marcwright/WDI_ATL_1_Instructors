require 'active_record'
require 'pry'

I18n.enforce_available_locales = false
ActiveRecord::Base.establish_connection("postgres://localhost/puppy")

class Puppy < ActiveRecord::Base

  validates :name,
    presence: true,
    length: {minimum: 3}

  validates :age,
    numericality: {
      less_than_or_equal_to: 1
      message: "is too old to be a puppy, that's a dog."
    }

end
