require 'spec_helper'

describe User do
  let(:user){user = User.find(1)}

  it "like remember and check" do
    user.like_remember(1)
    expect(user.like_check(1)).to be_false
    expect(user.like_check(2)).to be_true
    user.like_remember(2)
    expect(user.like_check(2)).to be_false
    expect(user.like_check(12)).to be_true
    user.like_remember(33)
    expect(user.like_check(3)).to be_true
    expect(user.like_check(1)).to be_false
    expect(user.like_check(2)).to be_false
    expect(user.like_check(33)).to be_false
  end
end
