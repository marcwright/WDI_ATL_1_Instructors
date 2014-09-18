#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-20 18:28:57
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-20 20:51:21

class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the app!"
      sign_in @user
      redirect_to @user
    else
      render 'new'
    end
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
