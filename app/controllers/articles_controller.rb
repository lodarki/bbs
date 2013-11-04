class ArticlesController < ApplicationController

  def index
    @topic = Topic.find(params[:topic_id])
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new(topic_id: params[:topic_id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @article = @topic.articles.create(params[:article].permit(:title, :detail, :permission).merge(:user_id => current_user.id))
    redirect_to topic_article_url(@article.topic, @article)
  end

  def update
    @article = Article.find(params[:id])
    @article.update(params[:article].permit(:topic_id,:title, :detail, :permission))
    ap @article
    redirect_to topic_article_url(@article.topic, @article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to topic_articles_url(topic_id: params[:topic_id])
  end

  def like
    @article = Article.find(params[:id])
    @article.update(like: @article.like+1)
  end
end
