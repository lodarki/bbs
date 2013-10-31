class ArticlesController < ApplicationController

  def index
    @for_num_name = ForNumName.find_by(id: params[:for_num_name_id])
  end

  def show
    @for_num_article = ForNumArticle.find_by(id: params[:id])
  end

  def new
    @for_num_article = ForNumArticle.new(for_num_name_id: params[:for_num_name_id])
    ap @for_num_article
    @for_num_article
  end

  def edit
    @for_num_article = ForNumArticle.find_by(id: params[:id])
  end

  def create
    @for_num_article = ForNumArticle.new(params[:for_num_article].permit(:for_num_name_id,:title, :detail, :permission))
    @for_num_article.user_id = current_user.id
    @for_num_article.save
    redirect_to article_url(@for_num_article.id)
  end

  def update
    ap params
    @for_num_article = ForNumArticle.find_by(id: params[:id])
    @for_num_article.update(params[:for_num_article].permit(:for_num_name_id,:title, :detail, :permission))
    redirect_to article_url(@for_num_article.id)
  end

  def destroy
    ap params
  end
end
