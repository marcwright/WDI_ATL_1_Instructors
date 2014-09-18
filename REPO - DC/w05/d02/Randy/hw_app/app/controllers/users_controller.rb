class UsersController < ApplicationController
  # The :require_signin method is defined in the sessions_helper.rb
  # file and establishes that, except for :new and :create requests,
  # a user must be signed in. This means to visit a profile, edit, see
  # all profiles, or destroy a user, the user must be signed in.
  before_action :require_signin, except: [:new, :create]
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

# The code above is basic things we have been doing in Rails.

# The difference in our create method is that we are not skipping
# straight into adding information to our DB, but are instead testing to
# see if your new user will pass validation and be capable of being saved.

# IF there are no errors, and the user can be saved.
# Our create method calls the sign_in method (defined in sessions_helper.rb)
# This will sign the user in and establish the creation of a new session
# for the user.

# Once the user has been successfully created, they are redirected to
# their specific profile page.

# Otherwise, they are sent back to the new form with errors showing.

  def create
    @user = User.new(user_params)
      if @user.save
        sign_in @user
        redirect_to @user
      else
        render :new
      end
  end

  def edit
  end
# Our update method works slightly differently then we have been used to.
# Essentially it acts like out User.new, in that we are seeing if the
# user is able to update (meaning no errors were raised) and if so,
# we redirect to the users specific profile

# Otherwise, the user is redirected back to the edit page with
# specific errors displayed.

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
