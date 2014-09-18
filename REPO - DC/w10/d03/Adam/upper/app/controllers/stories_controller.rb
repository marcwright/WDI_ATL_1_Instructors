class StoriesController < ApplicationController

  def index
    @stories = Story.all

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @stories }
    end
  end

  def create
    @story = Story.new(story_params)

    if @story.save
      render json: @story
    else
      render status: 400, nothing: true
    end
  end

  def update
    @story = Story.find(params[:id])

    if @story.update(story_params)
      render json: @story
    else
      render status: 400, nothing: true
    end
  end

  def destroy
    @story = Story.find(params[:id])

    if @story.destroy
      render json: {}
    else
      render status: 400, nothing: true
    end
  end

  private

  def story_params
    params.require(:story).permit(:title, :url)
  end

end
