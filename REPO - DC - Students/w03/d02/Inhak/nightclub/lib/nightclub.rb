require 'active_record'

I18n.enforce_available_locales = false
$connection = ActiveRecord::Base.establish_connection("postgres://localhost/nightclub_db")

class Clubber < ActiveRecord::Base
  validates :name,
    presence: true,
    length: { minimum: 2 }

  validates :age,
    presence: true,
    numericality: {
      greater_than_or_equal_to: 21,
      less_than: 60
    }

  validates :gender,
    presence: true,
    inclusion: {
      in: %w(m f),
      message: "Not a valid gender"
    }

  validate :gender_ratio


    def gender_ratio
      if gender == "m"
        males = Clubber.where(gender: "m").count
        females = Clubber.where(gender: 'f').count

        if males*2 >= females
          errors.add(:gender_ratio, "too many dicks on the dance floor")
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
