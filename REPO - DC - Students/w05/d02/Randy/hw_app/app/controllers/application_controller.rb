class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #Including SessionsHelper here will allow all of our controllers to
  #have access to the methods contained in SessionHelper, as all
  #the different controllers inherit from ApplicationController
  include SessionsHelper
end
