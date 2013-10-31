class ArticlesController < ApplicationController
  def index
    ForNumArticle.where(for_num_name_id: params[:id].to_i)
  end

  def show
    ap params
  end

  def new
    ap params
  end

  def edit
    ap params
  end

  def create
    ap params
  end

  def destroy
    ap params
  end
end
