require 'spec_helper'

describe Article do

  let(:current_user) { User.find(1) }
  let(:article) { FactoryGirl.create(:article)}

  it "article like by current_user" do
    expect(current_user.like_check(article.id)).to be_true
    expect{expect{article.like_by(current_user)}.to change{article.like}.by(1)}.to change{current_user.like_list}
    expect(current_user.like_check(article.id)).to be_false
  end
end