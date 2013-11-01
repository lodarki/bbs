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
    @article = Article.new(params[:article].permit(:topic_id,:title, :detail, :permission))
    @article.user_id = current_user.id
    @article.save
    # redirect_to article_url(@article.id)
    redirect_to @article
  end

  def update
    @article = Article.find(params[:id])
    @article.update(params[:article].permit(:topic_id,:title, :detail, :permission))
    # redirect_to article_url(@article.id)
    redirect_to @article
  end

  def destroy
    ap params
  end
end
