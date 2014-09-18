class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_action :require_signin, except: [:new, :create]
  before_action :require_current_user, only: [:edit]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # redirects to the user if the user is
    # successfully created. Else returns to form.
    if @user.save
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
    # if the user gets updated swith params
    # then the page gets directed to the user page.
    # otherwise it goes back to the edit page.
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

  def find_user
    @user = User.find(params[:id])
  end
end
