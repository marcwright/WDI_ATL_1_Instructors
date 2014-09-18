require 'active_record'
require 'pry'

I18n.enforce_available_locales = false
$connection = ActiveRecord::Base.establish_connection("postgres://localhost/puppy")

class Puppy < ActiveRecord::Base

  validates :name,
    presence: true,
    length: {minimum: 3}
  validates :age,
  numericality: {
    less_than_or_equal_to: 3,
    message: "Is too old to be pup. That a doge."
  }
end

binding.pry

# puppy.valid?
# puppy.errors.count
# puppy.errors.full_message
#
