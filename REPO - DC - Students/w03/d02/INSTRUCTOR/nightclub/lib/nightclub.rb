require 'active_record'

I18n.enforce_available_locales = false
$connection = ActiveRecord::Base.establish_connection("postgres://localhost/nightclub")

class Clubber < ActiveRecord::Base
  validates :name, length: { minimum: 2 }
  validates :age, numericality: { greater_than_or_equal_to: 21, less_than: 60 }
  validates :gender, inclusion: { in: %w(m f) }
  # validates :gender_ratio, numericality: { greater_than_or_equal_to: 200% }

  def format_gender
    if gender == 'f'
      "female"
    else
      "male"
    end
  end

  def gender_ratio?


  
  end


end