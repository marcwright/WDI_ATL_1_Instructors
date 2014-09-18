class Person < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true, uniqueness: true

  validate :active_person, on: :update

  def active?
    false
  end

  def active_person
      unless active?
        errors.add(:base, 'this is not an active person')
      end
  end


end
