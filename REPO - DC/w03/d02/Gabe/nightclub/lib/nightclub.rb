require 'active_record'
require 'pry'

I18n.enforce_available_locales = false
$connection = ActiveRecord::Base.establish_connection("postgres://localhost/misc") #connect to which database?

class Clubber < ActiveRecord::Base

validates :name,
  presence: true,
    length: {minimum: 2}

validates :age,
  numericality: {less_than_or_equal_to: 59,
      message: "is too old to enter the club... Old fart.",
                greater_than_or_equal_to: 21,
      message: "is too young to enter the club... Baby."}

validates :gender,
  inclusion: { in: %w(m f),
    message: "%{value} is not a gender (m or f only)" }


validate :gender_ratio
  def gender_ratio

    if gender == "m"
      males = Clubber.where(gender: 'm').count()
      females = Clubber.where(gender: 'f').count()

      if males*2 >= females # 2 to 1 F to M ratio
        errors.add(:gender_ratio, "is male. Club M to F ratio is currently at limit. ")
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

end #end class Clubber
