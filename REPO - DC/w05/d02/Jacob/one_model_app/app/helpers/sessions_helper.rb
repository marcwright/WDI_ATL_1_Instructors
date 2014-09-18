#After a user logs in, we'll want to access their identity throughout our entire application.
#So we break out session management tasks into a universal helper.

module SessionsHelper#Modules are packages of code that can be added into classes as needed.
  #We'll add this session helper into our main application controller,
  #which will provide its behaviors to all other controllers via inheritance.

  #Current user methods:

  #getter method
  def current_user
    remember_token = User.hash(cookies[:remember_token])#Grab any remember-token that exists within the cookie; Rails voodoo.
    @current_user ||= User.find_by(remember_token: remember_token)#Try to find a user with a matching hashed token.
  end

  #setter method
  def current_user=(user)
    @current_user = user
  end

  def current_user?(user)
    current_user == user#Sees if the result of the current_user method equals the user input.
  end

  #Signin Status methods:

  def signed_in?
    !current_user.nil#Makes sure there is a current user.
  end

  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.hash(remember_token))
    self.current_user = user
  end

  def sign_out
    current_user.update_attribute(:remember_token, User.hash(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  #Location Management methods:

  def store_location
    if request.get?
      session[:return_to] = request.universal
    end
  end

  #This method can be used in place of a normal redirect_to method in cases where the user
  #was asked to sign in before completing an action.
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  #Security Checkpoint method: used in any controller's before_action to prevent
  #the user from accessing content without signing in.
  def require_signin
    unless signed_in?
      store_location
      flash[:notice] = "Please sign in."
      redirect_to signin_url
    end
  end
end

