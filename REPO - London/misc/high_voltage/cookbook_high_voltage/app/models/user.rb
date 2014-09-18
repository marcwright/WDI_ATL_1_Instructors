class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :password, :password_confirmation

  validates :password, presence: true, on: :create

  validates :email, presence: true

  validates :email, uniqueness: true



  
end
