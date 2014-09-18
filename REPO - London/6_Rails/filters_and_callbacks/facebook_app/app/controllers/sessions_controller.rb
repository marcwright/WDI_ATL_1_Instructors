class SessionsController < ApplicationController
  skip_before_filter :require_login, only: [:new, :create]


  def new
    render text: "login, stranger"
  end

  def create
    session[:current_user_id] = User.first.try(:id)
    redirect_to users_path
  end    

  def destroy
    session.delete(:current_user_id)
    redirect_to users_path
  end    
end
