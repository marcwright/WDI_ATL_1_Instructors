module SessionsHelper
  def current_user
    remember_token = User.hash(cookes[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def current_user=(user)
    @current_user = user
  end

  def signed_in?
    !current_user.nil?
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

  def store_location
    if request.get?
      session[:return_to] = request.url
    end
  end

  def require_signin
    unless signed_in?
      store_location
      flash[:error] = 'Please sign in.'
      redirect_to signin_url
    end
  end
end # END OF MODULE
