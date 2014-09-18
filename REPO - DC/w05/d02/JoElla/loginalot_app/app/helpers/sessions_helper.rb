module SessionsHelper

  # Current User methods:

  def current_user
    #this takes cookie from the client's computer and hash-ifies it, so you can compare it wiht what's in your server db
    remember_token = User.hash(cookies[:remember_token])
    #Lookup short cut — says “if I exist, use me. If I don’t, go to the database and look it up”.
    @current_user ||= User.find_by(remember_token: remember_token)
  end


  #this setter method declares who is logged in
  def current_user=(user)
    @current_user = user
  end

  #determines whether given user is the current user
  def current_user?(user)
    current_user == user
  end

  # is user signed in?

  def signed_in?
    !current_user.nil?
  end

  def sign_in(user)
    #makes a new r-token
    remember_token = User.new_remember_token
    #sticks plain text token in user cookies
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.hash(remember_token))
    self.current_user = user
  end
  #put hashed version of users r-token in server db
  def sign_out
    current_user.update_attribute(:remember_token, User.hash(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  # This method plops the user's original goal url into session memory as "return_to"

  def store_location
    if request.get?
      session[:return_to] = request.url
    end
  end


  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  # requires user to sign in in order to continue; gives error requesting user sign in

  def require_signin
    unless signed_in?
      store_location
      flash[:error] = 'Please sign in.'
      redirect_to signin_url
    end
  end
end
