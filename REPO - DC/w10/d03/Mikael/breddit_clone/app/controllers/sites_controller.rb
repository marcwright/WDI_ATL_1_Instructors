class SitesController < ApplicationController

  def index
    @sites = Site.all

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @sites }
    end
  end

  def create
    @site = Site.new(site_params)

    require 'open-uri'
    @site.title = Nokogiri::HTML(open("#{site_params['site_url']}")).title

    if @site.save
      render json: @site
    else
      render status: 400, nothing: true
    end

  end

  def update
    @site = Site.find(params[:id])

    if @site.update(site_params)
      render json: @character
    else
      render status: 400, nothing: true
    end

  end

  def destroy
    @site = Site.find(params[:id])

    if @site.destroy
      render json: {}
    else
      render status: 400, nothing: true
    end
  end

  private

  def site_params
    params.require(:site).permit(:site_url, :title, :rating)
  end

end
