class User < ActiveRecord::Base
  before_create :create_remember_token
  before_save :normalize_fields

  validates :name,
    presence: true,
    length: { maximum: 40 }

  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    # this is regexp for checking to see if it si valid email form.
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  validates :password,
    length: { minimum: 8 }

  has_secure_password
  # Crypto methods. these provide the password methods
  # and has methods for the user class. a lot of these methods
  # are enacted upon itself.
  def User.new_remember_token
    # generates a string of random characters for the token.
    SecureRandom.urlsafe_base64
  end

  def User.hash(token)
    # makes the argument into a hash.
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = User.hash(User.new_remember_token)
  end

  def normalize_fields
    self.email.downcase!
  end

end
