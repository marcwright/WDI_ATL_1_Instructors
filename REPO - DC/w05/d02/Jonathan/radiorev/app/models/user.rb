class User < ActiveRecord::Base

# This is really the first time that we have
# used ActiveRecord validation on rails
# very straightforward and the docs are good
# still have some questions about why it
# validates certain data in certain ways

  # Ensures that there is a session or
  # cookie for each login
  before_create :create_remember_token
  # Ensures that data in all fields is valid
  before_save :normalize_fields

  validates :name,
    presense: true,
    length: { maximum: 50 }

  validates :email,
    presense: true,
    uniqueness: { case_sensitive: false },
    # I have no idea what this is, I'm guessing
    # it's some sort of format that covers
    # all email addresses
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  # Why wouldn't you validate uniqueness?
  # Because we don't store that in the database?
  validates :password,
    length: { minimum: 8 }
  # not sure how this magic works
  has_secure_password

  # Create a new token for each session
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  # one-way hashed token
  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

private

  # Creates a new session token while
  # assigning it to the current user?
  def create_remember_token
    self.remember_token = User.hash(User.new_remember_token)
  end

  # I believe that these are both privitizing
  # the information before this is validating
  # with the first 2 lines of this file. I'm
  # not sure why this code would be in this file
  # other than that it is related.
  def normalize_fields
    self.email.downcase!
  end

end #User
