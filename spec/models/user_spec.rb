require 'spec_helper'

describe User do
  before do
    User.seed_once(
      {id: 1, email: "11@11.com", encrypted_password: "1", sign_in_count: 0, right: 1, type: "User"},
      {id: 2, email: "22@22.com", encrypted_password: "2", sign_in_count: 0, right: 1, type: "User"},
      {id: 3, email: "33@33.com", encrypted_password: "3", sign_in_count: 0, right: 1, type: "User"}
    )
  end

  it "like remember and check" do
    user = User.find(1)
    user.like_remember(1)
    expect(user.like_check(1)).to be_true
    expect(user.like_check(2)).to be_false
    user.like_remember(2)
    expect(user.like_check(2)).to be_true
    expect(user.like_check(12)).to be_false
    user.like_remember(33)
    expect(user.like_check(3)).to be_false
    expect(user.like_check(1)).to be_true
    expect(user.like_check(2)).to be_true
    expect(user.like_check(33)).to be_true
  end

end
