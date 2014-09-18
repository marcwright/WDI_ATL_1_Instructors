class UsersController < ApplicationController
  # Before running file, call find_user method for show, edit, and destroy. - calling User.find(params[:id])
  # Before running file, call require_signin method except for new and create. - requiring user to be signed in to use site except in creation of account.
  # Before running file, call require_current_user method for edit - requiring a user to be signed in in order to edit.
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :require_signin, except: [:new, :create]
  before_action :require_current_user, only: [:edit]

  # allows new route access to User
  def new
    @user = User.new
  end

  # creates a new user based on the parameters
  # established in user_params method below
  # If a new user is successfully created,
  # redirect user to new user's page
  # Else, stay on create user page.
  def create
    @user=User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  # gives show route access to current user info
  # @user = User.find(params[:id]) defined above
  def show
  end

  # gives edit route access to current user info
  # @user = User.find(params[:id]) defined above
  def edit
  end

  # updates a current user based on the parameters
  # established in user_params method below
  # If a new user is successfully updated,
  # redirect user to user's page
  # Else, stay on edit user page.
  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  # deletes user profile and redirects to homepage
  def destroy
     @user.destroy
      redirect_to root_path
  end

  private

  # validates if user exists
  # sends to homepage
  def require_current_user
    if !current_user?(@user)
      redirect_to root_path
    end
  end

  # defines parameters required to for a user
  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end

  # DRY aspect for several of our above methods
  # which need to access the @user
  def find_user
    @user = User.find(params[:id])
  end

end
