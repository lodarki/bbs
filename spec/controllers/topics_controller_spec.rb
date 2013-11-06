require 'spec_helper'

describe TopicsController do

  before do
    user = User.find(1)
    sign_in user
  end

  it "GET index" do
    topics = double('topics')
    Topic.should_receive(:all){topics}
    get :index
    response.should be_success
    expect(assigns(:topics)).to eq(topics)
  end

  it "GET new" do
    topic = double('topic')
    Topic.should_receive(:new){topic}
    get :new
    response.should be_success
    expect(assigns(:topic)).to eq(topic)
  end

  it "GET edit" do
    topic = double('topic')
    Topic.should_receive(:find).with('1'){topic}
    get :edit, id: '1'
    response.should be_success
    expect(assigns(:topic)).to eq(topic)
  end

  it "GET show" do
    topic = double('topic')
    Topic.should_receive(:find).with('1'){topic}
    get :show, id: '1'
    response.should be_success
    expect(assigns(:topic)).to eq(topic)
  end

  it "POST create" do
    topic = mock_model(Topic)
    Topic.should_receive(:new).with({'name' => 'name1'}){topic}
    topic.should_receive(:save){true}
    post :create, topic: {:name => 'name1'}
    expect(assigns(:topic)).to eq(topic)
    response.should redirect_to(topic)
  end

  it "PUT update" do
    topic = mock_model(Topic)
    Topic.should_receive(:find).with('1'){topic}
    topic.should_receive(:update).with({'name' => 'name1'}){true}
    put :update, :id => '1', :topic => {'name' => 'name1'}
    expect(assigns(:topic)).to eq(topic)
    response.should redirect_to(topic)
  end

  it "DELETE destroy" do
    topic = double(Topic)
    Topic.should_receive(:find).with('1'){topic}
    topic.should_receive(:destroy){true}
    delete :destroy, :id => '1'
    response.should redirect_to(home_index_path)
  end
end
