class User < ActiveRecord::Base

  # Validate name:
  validates :name,
    presence: true,
    length: {maximum: 50}

  # Validate email address:
  validates :email,
    presence: true,
    uniqueness: {case_sensitive: false},
    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}

  # Validate password length:
  validates :password,
    length: {minimum: 8}

  # Secure password features:
  # this will generate:
  # @password attribute accessor,
  # @password_confirmation attribute accessor,
  # authenticate method (which compared stored, hashed string to user input incoming hashed string)
  # and additionally, relies on the password_digest column in users schema
  has_secure_password

  # Create a new remember token for a user:
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  # Hash a token:
  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  # Creates a new session token for the user:
  def create_remember_token
    remember_token = User.hash(User.new_remember_token)
  end

  # Normalize fields for consistency:
  # self refers to the instance
  # this gets called before the user instance is saved to the database via before_save
  def normalize_fields
    self.email.downcase!
  end
end
