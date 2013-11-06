require 'spec_helper'

describe ArticlesController do

  before do
    user = User.find(1)
    sign_in user
  end

  describe "GET 'index'" do
    it "returns http success" do
      topic = double(Topic)
      articles = double('articles')
      Topic.should_receive(:find).with('1'){topic}
      Article.should_receive(:where).with({:topic_id => '1'}){articles}
      articles.should_receive(:paginate).with({:page => '1', :per_page => 9}){articles}
      articles.should_receive(:order).with('"like" DESC'){articles}
      get :index, :topic_id => '1', :page => '1'
      response.should be_success
      expect(assigns(:topic)).to eq(topic)
      expect(assigns(:articles)).to eq(articles)
    end
  end

  it "GET 'show'" do
    article = double(Article)
    comments = double('Comments')
    Article.should_receive(:find).with('1'){article}
    Comment.should_receive(:where).with({:article_id => '1'}){comments}
    comments.should_receive(:paginate).with({:page => '1', :per_page => 9}){comments}
    comments.should_receive(:order).with('created_at DESC'){comments}
    get :show, :id => '1', :topic_id => '1', :page => '1'
    response.should be_success
    expect(assigns(:article)).to eq(article)
    expect(assigns(:comments)).to eq(comments)
  end

  it "GET 'new'" do
    article = double(Article)
    Article.should_receive(:new).with({:topic_id => '1'}){article}
    get :new, :topic_id => '1'
    response.should be_success
    expect(assigns(:article)).to eq(article)
  end

  it "GET 'edit'" do
    article = double(Article)
    Article.should_receive(:find).with('1'){article}
    get :edit, :id => '1', :topic_id => '1'
    response.should be_success
    expect(assigns(:article)).to eq(article)
  end

  it "POST create" do
    topic = double(Topic)
    articles = double('Articles')
    article = double(Article)
    Topic.should_receive(:find).with('1'){topic}
    topic.should_receive(:articles){articles}
    articles.should_receive(:create).with({"title" => 'title1', "detail" => 'detail1', "permission" => 'permission1', "user_id" => 1}){article}
    post :create, id: '1', topic_id: '1', article: {:title => 'title1', :detail => 'detail1', :permission => 'permission1'}
    expect(assigns(:topic)).to eq(topic)
    expect(assigns(:article)).to eq(article)
    response.should redirect_to(topic_article_path(topic, article))
  end
end
