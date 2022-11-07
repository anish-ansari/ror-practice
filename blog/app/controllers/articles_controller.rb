class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    # same as show, because we are finding the article to edit
    @article = Article.find(params[:id])
  end

  def create
    # this renders the parameters as a hash
    # render plain: params[:article].inspect

    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render "new"
      # redirect_to new_article_url
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render "edit"
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
