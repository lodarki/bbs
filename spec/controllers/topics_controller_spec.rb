require 'spec_helper'

describe TopicsController do

  before do
    user = User.find(1)
    ap User.all
    sign_in user
  end

end
