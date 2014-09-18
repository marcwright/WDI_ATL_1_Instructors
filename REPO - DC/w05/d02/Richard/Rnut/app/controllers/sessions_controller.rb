class SessionsController < ApplicationController

  def new
  end

  def create
    #Find the user by email:
    user = User.find_by(email: params[:session][:email].downcase)

    #If the user exists and the users password is valid/authentic sign in the user and send user back redirect path or path passed to method
    if user && user.authenticate(params[:session][:password])
      sign_in(user)
      redirect_back_or(root_url)
    else
      #if invalid, return error to screen and send user back to signin page
      flash[:error] = "Please enter valid Username and/or Password"
      redirect_to signin_path
    end
  end

  # Terminates current login session
  # redirects to home page
  def destroy
    sign_out
    redirect_to root_url
  end
end


