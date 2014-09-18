class SessionsController < ApplicationController
  def new
  end

  def create
    session_params = params[:session]

    user = User.find_by email: session_params[:email].downcase
    
    if user && user.authenticate(session_params[:password])
      sign_in user
      redirect_back_or user
    else
      flash[:error] = "Login error, please try again."
      redirect_to signin_path
    end
  end

  def destroy
    sign_out @current_user
    redirect_to root_url
  end
end
