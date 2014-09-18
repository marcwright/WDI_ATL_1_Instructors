class UsersController < ApplicationController
  before_action :require_signin

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

# what is 'sign_in' in the below method?
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect to @user
    else
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end

end
