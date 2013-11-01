class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def create
    @topic = Topic.new(params[:topic].permit(:name))
    @topic.save
    redirect_to @topic
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.update(params[:topic].permit(:name))
    redirect_to @topic
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy

    redirect_to home_index_path
  end
end
