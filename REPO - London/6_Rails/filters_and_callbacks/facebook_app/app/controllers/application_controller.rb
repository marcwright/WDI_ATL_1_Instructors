class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_login
  around_filter :catch_exceptions

  private
  def catch_exceptions
    yield
  rescue=>exception
    logger.debug 'Caught an exception'
    raise
  end


  public
  def current_user
    current_user_id = session[:current_user_id]
    if current_user_id
      User.find(current_user_id)
    end
  end

  def logged_in?
    !!current_user
  end

  private
  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section of the site"
      redirect_to new_login_url
    end
  end


end
