class ArticlesController < ApplicationController

  before_action :assign_article

  def index
    @for_num_name = ForNumName.find_by(params[:for_num_name_id])
  end

  def show
    ap params
  end

  def new
    @for_num_article = ForNumArticle.new(for_num_name_id: params[:for_num_name_id])
    @for_num_article
  end

  def edit
    ap params
  end

  def create
    ap params[:for_num_article]
    @for_num_article.attributes = params[:for_num_article]
    @for_num_article.save
    redirect_to @for_num_article
  end

  def destroy
    ap params
  end
end
