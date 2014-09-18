require 'active_record'

I18n.enforce_available_locales = false
$connection = ActiveRecord::Base.establish_connection(:adapter => "postgresql",
  :host => "localhost",
  :username => "postgres",
  :password => " ",
  :database => "nightclub_db")

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
    inclusion: %w(m f)

  validate :gender_ratio

  def gender_ratio
    if gender == "m"
      males = Clubber.where(gender: 'm').count
      females = Clubber.where(gender: 'f').count
      if males * 2 >= females
        errors.add(:gender_ratio, "requires twice as many females")
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
