require 'spec_helper'

describe UsersController do

  before do
    user = User.find(1)
    ap User.all
    sign_in user
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end
