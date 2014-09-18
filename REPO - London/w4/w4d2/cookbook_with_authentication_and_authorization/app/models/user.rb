class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :password, :password_confirmation

  validates :password, presence: true, on: :create
  validates :email, presence: true
  validates :email, uniqueness: true

  before_validation :set_default_role

  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end

  private
  def set_default_role
    self.role ||= :user
  end

end
