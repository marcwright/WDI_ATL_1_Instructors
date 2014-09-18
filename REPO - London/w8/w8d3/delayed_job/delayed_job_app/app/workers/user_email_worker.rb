class UserEmailWorker
  include Sidekiq::Worker

  sidekiq_options retry: false

  def perform(email)
    UserMailer.welcome_email(email).deliver
  end


end
