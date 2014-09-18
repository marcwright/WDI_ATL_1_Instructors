class Chef < ActiveRecord::Base
<<<<<<< HEAD
  has_many :dishes

  validates :name,
    presence: true
  validates :eliminated,
    inclusion: { in: [true, false] }
  validates :bank,
    numericality: true

end
=======
end
>>>>>>> 6d9b2704dc3fc6afc5ca02cd897756bc9cc2ad82
