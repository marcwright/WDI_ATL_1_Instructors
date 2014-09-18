class ArticlesController < ApplicationController
  def index
    @q = Article.search(params[:q])
    @articles = @q.result(:distinct => true)
  end

  def search
    index
    render :index
  end

  def published_articles
    @articles = Article.published.all
    render :index
  end

def michaels_articles
  @articles = Article.authored_by(1)
  render :index
end

  def new
    @article = Article.new
  end

  def create
    article = Article.create(params[:article])
    redirect_to(article)
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    article.update_attributes(params[:article])
    redirect_to(article)
  end

  def destroy
    article = Article.find(params[:id])
    article.delete
    redirect_to(articles_path)
  end


end
