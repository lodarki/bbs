require 'spec_helper'

describe ArticlesController do

  before do
    user = User.find(1)
    sign_in user
  end

  describe "GET 'index'" do
    it "returns http success" do
      topic = double('topic')
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

end
