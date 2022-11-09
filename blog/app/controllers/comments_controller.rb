class CommentsController < ApplicationController
  def index
  end

  def create
    # finding where to comment by article_id
    @article = Article.find(params[:article_id])
    # creating a new comment using the comment model that is associated to the article model
    @comment = @article.comments.create(comment_params)
    # redirecting to the show article page
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
