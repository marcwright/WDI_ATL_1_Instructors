class User < ActiveRecord::Base

  before_create :create_remember_token
  before_save :normalize_fields
  #makes sure the name field is filled out, and isn't more than 50 characters
  validates :name,
    presence: true,
    length: { maximum: 50 }
    #makes sure the email is filled out and doesn't duplicate someone else's
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false }
    #makes sure your password is 8 charcters long
  validates :password,
    length: { minimum: 8 }

    #gives you secret sauce powers for authentication & encryption; saves hashed passwords into password_digest on our server's db
    has_secure_password

    #generates random text for r-token
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
  #hashes that text
  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  #makes token for client
  def create_remember_token
    self.remember_token = User.hash(User.new_remember_token)
  end


  def normalize_fields
    self.email.downcase!
  end

end
