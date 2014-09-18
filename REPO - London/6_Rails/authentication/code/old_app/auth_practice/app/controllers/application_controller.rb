class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  before_filter :can_access_route

  private
  def can_access_route
    raise 'Permissions rejected' unless authorized?(current_user, params[:controller], params[:action])
  end

  private
  def authenticate
    unless logged_in?
      flash[:error] = "You must be logged in to access this section of the site"
      redirect_to login_url
    end
  end


  def authorized?(user, controller, action)
    case user.try(:role)
    when "admin" then true
    when "user"
      case controller
      when "secret" then false
      when "gossip" then true
      else 
        true
      end
    else
      true
    end
  end
end