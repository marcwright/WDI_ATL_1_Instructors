#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-20 18:23:46
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-20 20:58:45

class User < ActiveRecord::Base

  before_create :create_remember_token
  before_save { self.email = email.downcase }

  validates :name,
    presence: true,
    length: { maximum: 50 }

  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i } # email format regex

  validates :password,
    length: { minimum: 8 }

  # Secure password features:
  has_secure_password

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
