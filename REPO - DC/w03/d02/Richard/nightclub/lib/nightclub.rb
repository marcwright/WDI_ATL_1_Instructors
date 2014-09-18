require 'active_record'
require 'pry'

I18n.enforce_available_locales = false
$connection = ActiveRecord::Base.establish_connection("postgres://localhost/nightclub")

class Clubber < ActiveRecord::Base

  validates :name,
    presence: true,
    length: {minimum: 2}

  validates :age,
    presence: true,
    numericality: {
      greater_than_or_equal_to: 21,
      message: "is too young!, you want to go to jail!?",
      less_than: 60,
      message: "is too old, wrinkly!"
    }

  validates :gender,
    presence: true,
    inclusion: { in: %w(m f)
    }

  validate :gender_ratio

  def gender_ratio
    if gender == 'm'
      male_count = Clubber.where(gender: 'm').count
      female_count = Clubber.where(gender: 'f').count

      if male_count * 2 >= female_count
      errors.add(:gender_ratio, "is not sufficiently cute")
      end
    else
    end
  end

  validate :format_gender

  def format_gender
    if gender == 'm'
      return "male"
    else
      return "female"
    end
  end
end
