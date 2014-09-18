class UsersController < ApplicationController
  before_action :require_signin, except: [:new, :create]
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :require_current_user, only: [:edit]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # If the user's entered data passes all validations and can be saved, sign in the user upon creation of his account. Otherwise, reload the new account page.
    if @user.save
      sign_in @user
      redirect_to @user
    else
      render :new
    end

  end

  def show
  end


  def edit
  end

  def update
    # If the edited information passes through all the validations and can be saved, save the information and load the user's page. Otherwise, reload the edit page.
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end

  end

  def destroy
    @user.destroy
    redirect_to root_path
  end


  private

  def find_user
    @user = User.find(params[:id])
  end

  def require_current_user
    # If there is no current user identified, rediret to the home page.
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

end
