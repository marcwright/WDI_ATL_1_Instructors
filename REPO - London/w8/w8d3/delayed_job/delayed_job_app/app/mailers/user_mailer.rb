class UserMailer < ActionMailer::Base
  default from: "james@sleepykyoto.com"

  def welcome_email(email_address)
    @email_address = email_address
    mail(to: email_address, subject: 'Welcome to my cool site')
  end

end
