class SessionsController < ApplicationController

  def new
  end

  def create
    #Find the user by email — which you’ve gotten from the session object held by the params
    user = User.find_by(email: params[:session][:email].downcase)
    #Earlier in the user.rb model, we put has_secure_password.  This provides us with the “authenticate” method, which takes the plaint text password a user entered, SHA-hashes it and then compares with what’s in the db.
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or root_url
    else
      flash[:error] = 'Invalid email/password'
      redirect_to signin_path
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
