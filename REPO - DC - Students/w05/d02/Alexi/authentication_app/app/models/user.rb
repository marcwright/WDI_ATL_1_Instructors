class User < ActiveRecord::Base
  before_create :create_remember_token
  before_save :normalize_fields

  validates :user_name,
    presence: true,
    length: { maximum: 50 }

  validates :password,
    length: { minimum: 8 }

  has_secure_password

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.hash(token)
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
