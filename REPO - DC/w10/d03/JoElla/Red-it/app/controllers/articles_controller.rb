class ArticlesController < ApplicationController

  def index
    @articles = Article.order(:created_at)

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @articles }
    end
  end

  def create
    require 'open-uri'
    @article = Article.new(article_params)
    url = params[:url]
    @article.title = Nokogiri::HTML(open("#{article_params['url']}")).title
    if @article.save
      render json: @article
    else
      render status: 400, nothing: true
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      render json: @character
    else
      render status: 400, nothing: true
    end
  end

  private

  def article_params
    params.require(:article).permit(:url, :title, :votes)
  end



end
