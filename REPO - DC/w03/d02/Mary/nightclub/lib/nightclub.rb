require 'active_record'

I18n.enforce_available_locales = false
$connection = ActiveRecord::Base.establish_connection("postgres://localhost/nightclub")

class Clubber < ActiveRecord::Base
  validates :name,
    length: { minimum: 2 }

  validates :age,
    numericality: {
      greater_than_or_equal_to: 21,
      less_than_or_equal_to: 59
      }

  validates :gender,
    inclusion: %w(m f)

  validate :format_gender

  validate :gender_ratio

  def gender_ratio
    if gender == "f"
      true
    else
      if Clubber.where(gender: "m").count * 2 >= Clubber.where(gender: "f").count
        errors.add(:gender_ratio, "requires twice as many females.")
      end
    end
  end

  def format_gender
    if gender == "m"
      return "male"
    elsif gender == "f"
      return "female"
    end
  end


end
