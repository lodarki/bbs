class ArticlesController < ApplicationController

  before_filter :authenticate_user!, only: [:new, :edit]

  def index
    @topic = Topic.find(params[:topic_id])
    @articles = Article.where(:topic_id => params[:topic_id]).paginate(:page => params[:page], :per_page => 9).order('"like" DESC')
  end

  def show
    @article = Article.find(params[:id])
    @comments = Comment.where(:article_id => params[:id]).paginate(:page => params[:page], :per_page => 9).order('created_at DESC')
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
    redirect_to topic_article_url(@topic, @article)
  end

  def update
    @article = Article.find(params[:id])
    @article.update(params[:article].permit(:topic_id,:title, :detail, :permission))
    redirect_to topic_article_url(@article.topic, @article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to topic_articles_url(topic_id: params[:topic_id])
  end

  def like
    @article = Article.find(params[:id])
    @article.like_by(current_user)
    # current_user.like_remember(@article.id)
    # @article.update(like: @article.like+1)
  end
end
