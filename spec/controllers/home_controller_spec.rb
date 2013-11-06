require 'spec_helper'

describe HomeController do
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
end
