class UsersController < ApplicationController
  load_and_authorize_resource

  def create
    if @user.save
      session[:user_id] = @user.id unless current_user
      redirect_to users_path, notice: "Signed up!"
    else
      render "new"
    end

  end
end
