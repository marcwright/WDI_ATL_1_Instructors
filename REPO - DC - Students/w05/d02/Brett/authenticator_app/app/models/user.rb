class User < ActiveRecord::Base
  #A dd save handlers for formatting data
  before_create :create_remember_token
  # Does stuff like downcase email for our data
  before_save :normalize_fields

  # Validate the name
  validates :name,
  presence: true,
  length: { maximum: 50 }

  # Validate the email address
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  # Validate the password length
  validates :password,
    length: { minimum: 8 }

  # Include secure password features (adds password and password_confirmation fields into the model and validates that they match )
  # Securely hashes and saves passwords into the password_digest column.
  # Adds an authenticate method onto the User Model, which accepts plain text and tests if matching stored password digest.
  has_secure_password

  # Create a new remember token for a user in a class method
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  # Hash a token input from the user
  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  # Creates a new session token for the user
  def create_remember_token
    remember_token = User.hash(User.new_remember_token)
  end

  # Normalizes fields such as email for consistency
  def normalize_fields
    self.email.downcase!
  end

end
