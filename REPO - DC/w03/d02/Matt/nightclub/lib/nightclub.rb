require 'active_record'
require "pry"

I18n.enforce_available_locales = false
$connection = ActiveRecord::Base.establish_connection("postgres://localhost/nightclub_db")

class Clubber < ActiveRecord::Base

  validates :name,
    length: { minimum: 2 }

  validates :age,
    numericality: {
      greater_than_or_equal_to: 21,
      less_than: 60
    }

  validates :gender,
    inclusion: %w(m f)

  validate :gender_ratio
    def gender_ratio
      if gender == 'm'
        males = Clubber.where(gender: 'm').count()
        females = Clubber.where(gender: 'f').count()
        if m * 2 >= f
          errors.add(:gender_ratio, "need less bros")
        end
      end
    end

    def format_gender
      if gender == "m"
        return "male"
      else
        return "female"
      end
    end




end
