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
    if @user.save#Evaluates to t or f based on whether or not the validations in user.rb passed when user_params were entered.
      sign_in @user
      redirect_to @user
    else
      render :new#If you messed up you get taken back to the form to re-enter your info.
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)#Same as with the create method.
      redirect_to @user
    else
      render :edit
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
    if !current_user(@user)
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
    #Even though the corresponding attribute in our database is 'password_digest', the Rails voodoo
    #of has_secure_password maps password and password_confirmation to one encrypted password digest.
  end
end
