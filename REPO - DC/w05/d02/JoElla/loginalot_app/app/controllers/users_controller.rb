class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]
    before_action :require_signin, except: [:new, :create]
    before_action :require_current_user, only: [:edit]



  def new
    @user = User.new
  end


  #only moves the user to their page if the account can be successfully saved, otherwise goes back to signup
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def show
  end






  private


  def find_user
    @user = User.find(params[:id])
  end

  def require_current_user
    if !current_user?(@user)
      redirect_to root_path
    end
  end
  #regular strong params; has_secure_password translates password/pword conf into hash digest in our db
  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
      )
  end



end
