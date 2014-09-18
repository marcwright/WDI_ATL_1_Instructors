require 'active_record'
require "pry"

I18n.enforce_available_locales = false
$connection = ActiveRecord::Base.establish_connection("postgres://localhost/nightclub_db")

class Clubber < ActiveRecord::Base
  validates :name, length: { minimum: 2 }
  validates :age, numericality: { greater_than: 20, less_than: 60 }
  validates :gender, inclusion: { in: %w(m f) }
  validate :gender_ratio

  def format_gender
    case self.gender
    when "f" then "female"
    when "m" then "male"
    end
  end

  def gender_ratio
    return if self.gender == "f"

    female_clubbers = Clubber.where(gender: "f").all.size
    male_clubbers = Clubber.where(gender: "m").all.size + 1
    errors.add(:gender_ratio, "can't have a sausage fest") if male_clubbers > female_clubbers * 2
  end
end
