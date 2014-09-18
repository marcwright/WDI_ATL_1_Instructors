class User < ActiveRecord::Base
  before_create :create_remember_token
  before_save :normalize_fields

  validates :name,
    presence: true, length: { maximum: 50 }
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password,
    presence: true,
    length: { minimum: 8 }

  has_secure_password

  # generates remember token
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  # hashes a string
  def User.hash(token)
    Digest::SHA1.hexdigest token.to_s
  end

  private
  def normalize_fields
    name.capitalize!
    email.downcase!
  end

  def create_remember_token
    self.remember_token = User.hash User.new_remember_token
  end
end
