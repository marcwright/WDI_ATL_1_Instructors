require 'active_record'

I18n.enforce_available_locales = false
$connection = ActiveRecord::Base.establish_connection("postgres://localhost/nightclub")

class Clubber < ActiveRecord::Base
  validates :name,
   length: { minimum: 2 }

  validates :age,
   numericality: {
    less_than_or_equal_to: 59,
    greater_than_or_equal_to: 21
  }

  validates :gender,
   inclusion: { in: %w(m f),
    message: "No tranies please!"
  }

  validate :gender_ratio

  def gender_ratio
    if gender == "m"
      males = Clubber.where(gender: 'm').count()
      females = Clubber.where(gender: 'f').count()

      if males*2 >= females
        errors.add(gender_ratio, "Bring a couple of ladies")
      end
    end
  end #gender_ratio


  def format_gender
    if gender == "m"
      return "male"
    else gender == "f"
      return "female"
    end
  end #format_gender


end #Clubber
