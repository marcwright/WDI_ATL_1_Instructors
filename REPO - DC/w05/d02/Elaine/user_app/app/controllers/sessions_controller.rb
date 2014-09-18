class SessionsController < ApplicationController

  def new
  end

  def create
    # Find the user by email:
    # This locates the user with a lowercase version of the email entered in the signup form.
    user = User.find_by(email: params[:session][:email].downcase)

    # Test if the user was found AND authenticated
    # If the user has been located, and if the password matches what was saved, sign in the user and either direct the user to the page he was heading to or to the home page.
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or root_url
    else
      # If either the user wasn't located or the password didn't match, show an error message and reload the sign in page.
      flash[:error] = 'Invalid email/password.'
      redirect_to signin_url

    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
