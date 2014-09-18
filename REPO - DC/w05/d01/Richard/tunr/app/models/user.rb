class User < ActiveRecord::Base

  validates :name,
    presence: true,
    length: { maximum: 50 }

  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  validates :password,
    length: { minimum: 6 }

  has_secure_password

  #Crypto Methods for working with Password

  # is referenced in sessions helper
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.hash(token)
    Digest::SHA2.hexdigest(token.to_s)
  end

  private
  def normalize_fields
    email.downcase!
  end
end
