class User < ActiveRecord::Base
# Makes sure that these methods are carried out before a create or save
# action can be completed. This ensures emails are lowercase and that
# the database will have a hash value in the field for security purposes.
  before_create :create_remember_token
  before_save :normalize_fields

# Validation to to ensure that the name field got a value and
# that the value is less than 50 characters long.
  validates :name,
    presence: true,
    length: { maximum: 50 }

# Validation test to ensure the email address exists &
# is in the proper format.
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

# Validation test to ensure that the password value is at
# least a minimum length (security).
  validates :password,
    length: { minimum: 8 }

 # Rails being awesome and taking our :password and :password_confirmation
 # values to make sure they match and we have a secure password.
  has_secure_password

#A method used to reate a new remember_token for a user in the
# base_64 format
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

# This method takes a remember_token and will pass it though a hashing
# procedure to create a hash.
  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

# This method will create a remember_token hash value and assign it
# to the database.
  def create_remember_token
    self.remember_token = User.hash(User.new_remember_token)
  end

# This method will ensire that all email information entered will be
# in lowercase letters so that our regular expression won't break.
  def normalize_fields
    self.email.downcase!
  end
end
