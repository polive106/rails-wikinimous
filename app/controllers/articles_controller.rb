class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  # => List all articles
  def index
    @articles = Article.all
  end
  # => View the detail of an article
  def show
  end

  # => create a new article
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_path
  end
  # => edit an existing article
  def edit
  end

  def update
    @article.save
    redirect_to articles_path
  end

  # => delete an article
  def destroy
    @article.delete
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
