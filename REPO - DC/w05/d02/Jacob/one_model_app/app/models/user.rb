class User < ActiveRecord::Base
  #Add save handlers for formatting data
  before_create :create_remember_token #This becomes the user's initial login session.
  before_save :normalize_fields #Downcases the user's e-mail.

  #validate the user's name
  validates :name,
    presence: true,#makes sure the name exists
    length: {maximum: 50}#makes sure the name is no longer than 50 characters

  #validate the user's email address
  validates :email,
    presence: true,#makes sure an email exists
    uniqueness: {case_sensitive: false},#makes sure the email is unique and case-insensitive
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }#regex that makes sure the email is correctly formatted

  #validate the user's password
  validates :password
    length: {minimum: 8}#makes sure password is at least 8 characters long

  has_secure_password
    #adds password and password_confirmation fields onto the model, and validates that they always match
    #securely hashes and saves passwords into the password_digest column
    #adds an authenticate method onto the User model, which accepts plain text and tests if it matches the stored password

  #Create a new remember token for a user:
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  #Hash a token:
  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  #Creates a new session token for the user:
  def create_remember_token
    remember_token = User.hash(User.new_remember_token)
  end

  #Normalizes the email field for consistency:
  def normalize_fields
    self.email.downcase!
  end

end
