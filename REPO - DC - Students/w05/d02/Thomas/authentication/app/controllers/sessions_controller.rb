class SessionsController < ApplicationController

  def new
  end

  def create
    # Find the user by email:
    user = User.find_by(email: params[:session][:email].downcase)

    # Test if the user was found, then authenticates:
    if user && user.authenticate(params[:session][:password])
      sign_in user
# I don't understand this 'redirect_back_or'
      redirect_back_or user
    else
      flash[:error] = 'Invalid email/password'
      # new_session points to sign in page!
      redirect_to new_session_path
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
