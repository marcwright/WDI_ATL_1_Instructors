#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-20 16:40:03
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-20 17:12:41

class User < ActiveRecord::Base
  # Add handlers to run when creating and saving
  before_create :create_remember_token # makes a token for the session
  before_save :normalize_fields # just makes email lowercase, for now

  # Validate name:
  validates :name,
    presence: true,
    length: { maximum: 50 }

  # Validate email address:
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i } # email format regex

  # Validate password length:
  validates :password,
    length: { minimum: 8 }

  # Secure password features:
  has_secure_password

  # Create a new remember token for a user:
  def User.new_remember_token
    SecureRandom.urlsafe_base64 # generates a base64 token
  end

  # Hash a token:
  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s) # SHA is a hash method to hash the remember token so we can store it in the database
  end

  private

  # Creates a new session token for the user:
  def create_remember_token
    self.remember_token = User.hash(User.new_remember_token)
  end

  # Normalize fields for consistency:
  def normalize_fields
    self.email.downcase!
  end
end
