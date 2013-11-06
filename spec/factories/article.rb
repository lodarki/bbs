FactoryGirl.define do

  factory :article do |f|
    f.id 1
    f.topic_id 1
    f.title 'title1'
    f.detail 'detail1'
    f.user_id '2'
    f.permission 1
    f.like 0
  end

end