require 'active_record'

I18n.enforce_available_locales = false
$connection = ActiveRecord::Base.establish_connection("postgres://localhost/nightclub")

class Clubber < ActiveRecord::Base

  validates :name, length: {minimum: 2, too_short: "%{count} characters is the minimum allowed"}

  validates :age,
    numericality: {
      greater_than_or_equal_to: 21,
      less_than_or_equal_to: 59
    }

  validates :gender,
    inclusion: {
      in: %w(m f)
    }

  validates :gender_ratio,

  def gender_ratio
    if gender == "m"
      males = Clubber.where(gender: 'm').count()
      females = Clubber.where(gender: 'f').count()

      if males*2 >= females
        errors.add(:gender_ratio, "requires more males than females")
      end
    end
  end


  validates :format_gender,

end
