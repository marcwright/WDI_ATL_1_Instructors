class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :email, :github_handle, :password, :password_confirmation, :age))
    
    if @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  
end
