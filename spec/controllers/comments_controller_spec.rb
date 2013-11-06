require 'spec_helper'

describe CommentsController do

  let(:user) { User.find(1) }

  before do
    sign_in user
  end

  it "GET new" do
    comment = double(Comment)
    Comment.should_receive(:new).with(:article_id => '1'){comment}
    get :new, article_id: '1', id: '1', topic_id: '1'
    response.should be_success
    expect(assigns(:comment)).to eq(comment)
  end

  it "POST create" do
    article = double(Article, topic: double(Topic))
    comments = double('comments')
    comment = double(Comment)
    Article.should_receive(:find).with('1'){article}
    article.should_receive(:comments){comments}
    comments.should_receive(:create).with({'article_id' => '1', 'detail' => 'detail1', 'user_id' => user.id}){comment}
    post :create, id: '1', article_id: '1', topic_id: '1', comment: {:article_id => '1', :detail => 'detail1'}
    expect(assigns(:article)).to eq(article)
    expect(assigns(:comment)).to eq(comment)
    response.should redirect_to(topic_article_path(article.topic, article))
  end

  it "DELETE destroy" do
    article = double(Article, topic: double(Topic))
    comment = double(Comment)
    Article.should_receive(:find).with('1'){article}
    Comment.should_receive(:find).with('1'){comment}
    comment.should_receive(:destroy){true}
    delete :destroy, id: '1', article_id: '1', topic_id: '1'
    expect(assigns(:article)).to eq(article)
    expect(assigns(:comment)).to eq(comment)
    response.should redirect_to(topic_article_path(article.topic, article))
  end
end
