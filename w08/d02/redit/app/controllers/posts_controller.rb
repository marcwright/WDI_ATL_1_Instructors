class PostsController < ApplicationController
  def new
  end

  def index
    @posts = Post.all
    render json: @posts
  end
end