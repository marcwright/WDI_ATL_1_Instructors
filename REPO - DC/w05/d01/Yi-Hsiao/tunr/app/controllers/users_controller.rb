class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]
  before_action :require_signin, except: [:new, :create, :show]
  before_action :require_current_user, only: [:edit]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    save_user
  end

  def show
  end

  def edit
  end

  def update
    @user.assign_attributes(user_params)
    save_user
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def save_user
    if @user.save
      redirect_to @user
    else
      case params[:_method]
      when "post" then render :new
      when "patch" then render :edit
      end
    end
  end
end
