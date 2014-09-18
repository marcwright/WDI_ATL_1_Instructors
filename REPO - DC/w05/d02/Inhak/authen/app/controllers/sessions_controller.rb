class SessionsController < ApplicationController

  def new
  end

  def create
    # The session is available in the parameters as a hash.
    # you can access the email variable in the session hash.
    user = User.find_by(email: params[:session][:email].downcase)

    # makes sure both user and password entry evaluates to true
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
      flash[:error] = 'Your email or password was wrong.'
      redirect_to signin_path
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
