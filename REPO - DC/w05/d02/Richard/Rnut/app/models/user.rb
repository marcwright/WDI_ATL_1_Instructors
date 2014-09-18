class User < ActiveRecord::Base
  #creates a class which inherits from ActiveRecord

  #validates the presence of a user name, and
  #prevents the name from being longer than 50
  #characters
  validates :name,
    presence: true,
    length: { maximum: 50 }

  #validates the presence of an email and prevents
  #it from being the same as any other record.
  #Prevents the input to be case_sensitive, and
  #verifies a valid email input with regex.
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    format: {  with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  #validates the presence of an email and prevents
  #it from being shorter than 6 characters
  validates :password,
    length: { minimum: 6 }

  #Adds Crypto methods to set and authenticate against a BCrypt password. This mechanism requires you to have a password_digest attribute.
  #Validations for presence of password on create, confirmation of password (using a password_confirmation attribute) are automatically added. If you wish to turn off validations, pass validations: false as an argument. You can add more validations by hand if need be.
  has_secure_password

  #Create a new remember token for a user:
  def User.new_remember_token
    #method will generate a new randomized token each time it is called
    SecureRandom.urlsafe_base64
  end

  #Hashes newly created token
  def User.hash(token)
    #method will transform plain text into a hashed digest. A discrete plain text phrase will always hash into the same digest. However, even small modifications to the plain text phrase will result a completely different hash. This makes hashing useful as a "fingerprint" for data
    Digest::SHA2.hexdigest(token.to_s)
  end

  private
  #Normalize fields for consistency:
  def normalize_fields
    email.downcase!
  end
end
