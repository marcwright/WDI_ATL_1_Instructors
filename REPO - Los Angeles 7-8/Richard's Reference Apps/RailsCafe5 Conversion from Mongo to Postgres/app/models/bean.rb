class Bean < ActiveRecord::Base
  has_many :pairings
  has_many :pastries, through: :pairings


  # some way of showing a list
  def pastry_list
    pastries_string = ""
    pastries.each do |one_pastry|
      pastries_string += ", " + one_pastry.name
    end
    pastries_string.slice(2,pastries_string.length - 1)
    #pastries_string
  end
end
