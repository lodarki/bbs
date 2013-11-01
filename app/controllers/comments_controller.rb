class CommentsController < ApplicationController
  def new
    @comment = Comment.new(article_id: params[:article_id])
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(params[:comment].permit(:article_id, :detail).merge(:user_id => current_user.id))
    redirect_to topic_article_path(@article.topic, @article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to topic_article_path(@article.topic, @article)
  end
end
