module SessionsHelper

  #  This method is used to get the current user. It is a GETTER METHOD.
  # It will search the DB for a user who matchs the hash value associated with
  # the user remember_token value.

  #  This Method makes use of the || operator in setting the current_user
  # if the current user exists, it is set to itself. Otherwise, it is set to
  # the user that matches the DB Query for the matching hash association.

  #  This keeps the program from making a DB query everytime we need to makes
  # reference to the current_user. (Understanding 90%)

  def current_user
    remember_token = User.hash(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token:remember_token)
  end

# ====================================================================================
  # This method is our setter method, and allows us to set the current_user
  # equal to a passed user who is logged in throught a SETTER METHOD
  # (Understanding 90%)

  def current_user=(user)
    @current_user = user
  end

# ====================================================================================
  # This method is used to determine if the user passed as a param is the same
  # entity as the current_user. (Understanding 90%)

  def current_user?(user)
    current_user == user
  end


# ====================================================================================

# ====================================================================================
      #SIGNIN STATUS METHODS
# ====================================================================================

  #   This method is used to check to see if the user making a request to the if
  # user making requests to the app is actually signed in.

  # It checks to see if the current user isn't nil (true), or is nil (false).
  # (Understanding 100%)

  def signed_in?
    !current_user.nil?
  end

# ====================================================================================
# This method signs in a user, by assignment of a remember_token.

#  The .permanent method applied to cookies changes the expiration date
#  to 20 years in the future.

# After assigning a user a plaintext remember_token, the .update_attribute
# method changes what we have store in the DB for the Users remember_token
# to the Hashed association of that plaintext token.

#Finally, this method sets the user who was passed into this method to
# be the current user by calling the .current_user= SETTER METHOD.
# (Understanding 88%)

  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.hash(remember_token))
    self.current_user = user
  end

# ====================================================================================
# This method is used to sign out our current user.

# Firstly, the method changes the value we have stored in our DB
# for the user remember_token hashed association to a new hash that,
# while a valid hash is unassociated with the users remember_token.
# We do this so that the entries in the DB will all appear the same
#(As in no user can be determined signed in/out based on remember_token hash value
# being a hash or nil) all users will have a hash in their row, only signed in
#users have a hash with a real association to a remember_token.

# Next, the method deletes the plaintext remember_token from the users cookies

# Finally, the method calls the .current_user= SETTER METHOD on itself
# in order to set the current user to nil.
# We could then call the singed_in? method and get a return of FALSE
# (Understanding 100%)

  def sign_out
    current_user.update_attribute(:remember_token, User.hash(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end

# ====================================================================================
           # LOCATION MANAGEMENT METHODS
# ====================================================================================

# This method is used to store the route an un-authorized user for later use

# It checks to see if the request from an un-authorized (not signed in) user
# is a GET request, and if it is to store the URL of their request as a value
# associated to the key :return_to.

# (Understanding 100%)

  def store_location
    if request.get?
      session[:return_to] = request.url
    end
  end

# ====================================================================================
# This method will redirect a user (after a successful sign in) to either
# their stored location by getting the value(URL) of [:return_to] from
# the users sessions memory OR it will send the user to a default URL
# that was passed as a parameter.

# Finally, the method will delete from the users session memory the value of
# of :return_to as it is no longer needed

#(Understanding 99%)

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

# ====================================================================================
        #SECURITY CHECKPOINT METHOD
# ====================================================================================

# This method will be used in the UsersController before all methods there.
# It will require that before a user can access any information, they must sign in.

# This method will only apply to users who are not signed in.

# If a user is making a request, but not signed in the method will store their
# desired location via the previously established store_location method

# The method will also redirect the non-signed-in user to the sign in page
# and display an error via flash to ask the user to sign in.
# Once signed in a user will be routed to either their originial request
# or to a defaut path.
#(Understanding 85%)

  def require_signin
    unless signed_in?
      store_location
      flash[:error] = 'Please Sign In'
      redirect_to signin_path
    end
  end

# ====================================================================================
# ====================================================================================
# ====================================================================================
end
