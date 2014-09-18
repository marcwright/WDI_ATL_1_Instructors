class User < ActiveRecord::Base
  attr_accessible :email, :name
  after_create :send_welcome_email

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  private
  def send_welcome_email
    UserEmailWorker.perform_async(self.email)
  end
end
