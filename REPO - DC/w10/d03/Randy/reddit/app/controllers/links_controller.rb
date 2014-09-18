class LinksController < ApplicationController

  def index
    @links = Link.all

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @links }
    end
  end

  def create
    @link = Link.new(link_params)

    require 'open-uri'
    @link.title = Nokogiri::HTML(open("#{link_params['url']}")).title

    if @link.save
      render json: @link
    else
      render status: 400, nothing: true
    end
  end

  def update
    @link = Link.find(params[:id])

    if @link.update(link_params)
      render json: @link
    else
      render status: 400, nothing: true
    end
  end

  def destroy
    @link = Link.find(params[:id])

    if @link.destroy
      render json: {}
    else
      render status: 400, nothing: true
    end
  end

  private
    def link_params
      params.require(:link).permit(:title, :url, :votes)
    end
end
