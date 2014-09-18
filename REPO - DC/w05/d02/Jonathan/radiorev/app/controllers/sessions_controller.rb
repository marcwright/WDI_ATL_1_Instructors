# The sessions controller actually routes
# user information and authenfication to
# and from the browser session

class SessionsController < ApplicationController

  # Why are we using this?:
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    # Tests if the user was found and if found
    # authenticates "signs_in" and redirects
    # back to a page showing confirmation
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or root_url

    # If the user authentification test does
    # does not pass then the user is given an
    # error message then sent back to the login
    else
      flash[:error] = "Invalid email or password"
      redirect_to new_session_path
    end
  end

  # This method breaks the user session by
  # routing them back to the DELETE route
  # defined as "sign_out"
  def destroy
    sign_out
    redirect_to root_url
  end

end #SessionsController
