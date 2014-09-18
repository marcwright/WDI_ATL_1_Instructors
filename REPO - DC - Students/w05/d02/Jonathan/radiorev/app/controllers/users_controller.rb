class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # This saves the session or cookie? ...
    # when the user logs in?
    if @user.save
      sign_in @user
      redirect_to @user
    else
      render :new
    end
  end

  # Still need to know if these are here
  # generally for good practice/convention
  # or if they are actually required
  def show
  end

  def edit
  end

  #
  def update
    if @user.update(user_params)
      redirect_to @user
    # If the user info doesn't update, then
    # send them back to the edit page
    else
      render :edit
    end
  end

  def destroy
    @user.destory
    redirect_to root_path
  end

# Specific and private user data. This also
# feeds in that data before methods are initiated
private

  #
  def find_user
    @user = User.find(params[:id])
  end

  # This ensures that the current user
  # is logged-in on every page?
  # (Don't know where this is used specifically)
  def require_current_user
    if !current_user?(@user)
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end

end #UsersController
