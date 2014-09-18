class Student
  validates :name,
  presence: true,
  length: {
    minimum 1
  }

validates :energy,
    presence: true,
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 100,
  }

validates :knowledge,
    presense: true,
    numericality: {
      only_integer: true,
  }
end

