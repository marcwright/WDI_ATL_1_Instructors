require 'active_record'
require 'pry'

I18n.enforce_available_locales = false
$connection = ActiveRecord::Base.establish_connection("postgres://localhost/nightclub")

class Clubber < ActiveRecord::Base
  validates :name, length: { minimum: 2 }
  validates :age, numericality: { greater_than_or_equal_to: 21, less_than: 60 }
  validates :gender, :inclusion %w(m f)
  validate :gender_ratio

  def gender_ratio
    return if self.gender == "f"

    female_clubbers = Clubber.where(gender: "f").all.size
    male_clubbers = Clubber.where(gender: "m").all.size
    errors.add(:gender_ratio, "ratio out of whack") if male_clubbers >= female_clubbers * 2
  end

  def format_gender
    return "male" if self.gender == "m"
    return "female" if self.gender == "f"
  end
end
