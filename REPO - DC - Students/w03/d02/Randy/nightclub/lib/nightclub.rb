require 'pry'
require 'active_record'

I18n.enforce_available_locales = false
$connection = ActiveRecord::Base.establish_connection("postgres://localhost/nightclub")

class Clubber < ActiveRecord::Base

validates :name, length: {minimum: 2}
validates :age, numericality: {greater_than_or_equal_to: 21, less_than: 60}
validates :gender, inclusion: {in: %w(m f)}
validate :gender_ratio



  def format_gender
    if gender == "f"
      return "female"
    elsif gender == "m"
      return "male"
    end
  end

  def gender_ratio
    if gender == "m"
      guys = Clubber.where(gender: "m").count()
      gals = Clubber.where(gender: "f").count()
        if (guys*2) >= gals
         errors.add(:gender_ratio, "Too many dudes.")
        end
    end
  end
end
