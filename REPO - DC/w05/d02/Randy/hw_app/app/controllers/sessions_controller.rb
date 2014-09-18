class SessionsController < ApplicationController

# The new method will create a new session by a user going
# to the sign in page, signing in and getting a remember_token.

  def new
  end

# The create method will attempt to create a new session (sign in) using
# the information contained in the params, specifically email to
# locate the user and, if found to verify their authentication.

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or root_path
    else
      flash[:error] = 'Invalid email/password'
      redirect_to signin_path
    end
  end

# This method is to destroy a particular session, this will be accomplished
# throught the use of the sign_out method defined in the sessions_helper.rb
# file.

  def destroy
    sign_out
    redirect_to root_url
  end
end
