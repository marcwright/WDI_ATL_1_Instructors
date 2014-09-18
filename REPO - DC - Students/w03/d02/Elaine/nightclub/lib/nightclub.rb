require 'active_record'

I18n.enforce_available_locales = false
$connection = ActiveRecord::Base.establish_connection("postgres://localhost/nightclub")

class Clubber < ActiveRecord::Base
    validates :name,
      presence: true,
      length: { minimum: 2 }

    validates :age,
      numericality: {
        greater_than_or_equal_to: 21,
        less_than: 60
      }

    validates :gender,
      inclusion: {
        in: %w(m f),
        message: "is not a valid gender."
      }

    validate :gender_ratio

    def gender_ratio
      if gender == 'm'
        num_males = Clubber.where(gender: 'm').count

        num_females = Clubber.where(gender: 'f').count

        if ( num_males * 2 ) >= num_females
          errors.add(:gender_ratio, "requires twice as many females.")
        end
      end
    end

    validate :format_gender

    def format_gender
      if gender == "m"
        return "male"
      elsif gender == "f"
        return "female"
      end

    end


end
