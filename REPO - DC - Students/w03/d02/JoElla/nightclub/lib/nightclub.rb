require 'active_record'

I18n.enforce_available_locales = false
$connection = ActiveRecord::Base.establish_connection("postgres://localhost/nightclub")

class Clubber < ActiveRecord::Base
  validates :name, length: { minimum: 2 }

  validates :age,
    numericality: {
      greater_than:20,
      less_than:59
    }

  validates :gender,
    inclusion: {
      in: %w(m f)
    }

    validate :gender_ratio

    def gender_ratio
      if gender == "m"
        males = Clubber.where(gender: 'm').count()
        females = Clubber.where(gender: 'f').count()

        if males*2 >= females
          errors.add(:gender_ratio, "requires twice as many females" )
        end
      end

    end


    def format_gender
      if gender == 'm'
        return "male"
      else
        return "female"
      end
    end

end
