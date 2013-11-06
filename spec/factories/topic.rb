FactoryGirl.define do
  factory :topic do |f|
    f.id "1"
    f.name "name1"
  end

  factory :valid_topic_params, class: Topic do |f|
    f.name "name1"
  end
end