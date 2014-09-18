# Stephen Stanwood (stephen@stanwoodsolutions.com)

# CREATE TABLE clubbers (
#   id serial PRIMARY KEY,
#   name varchar(100) NOT NULL,
#   gender varchar(1) NOT NULL,
#   age integer NOT NULL
# );

require 'active_record'

I18n.enforce_available_locales = false
$connection = ActiveRecord::Base.establish_connection("postgres://localhost/nightclub")

class Clubber < ActiveRecord::Base
  validates :name, length: { minimum: 2 }
  validates :age, inclusion: { in: (21...60) }
  validates :gender, inclusion: { in: ["m", "f"] }
  validate :gender_ratio

  # Custom validation method that preserves the 2:1 female:male ratio
  def gender_ratio
    # women always get in
    return if gender == 'f'

    # count the number of men and women
    m = Clubber.where(gender: "m").count
    f = Clubber.where(gender: "f").count

    errors.add(:gender_ratio, "says that there are not enough women in the club!") if m * 2 >= f
  end

  # Returns gender formatted as a full string
  def format_gender
    return gender == 'f' ? "female" : "male"
  end

  # Returns a representation of the clubber as a readable string
  def to_s
    return "#{name.capitalize} (#{age}-year-old #{format_gender})"
  end
end
