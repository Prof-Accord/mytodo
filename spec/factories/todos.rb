FactoryBot.define do
  factory :todo, class: Todo do
    association :user
    title { "MyString" }
    content { "MyText" }
    created_at { 1.hours.ago }
  end

  factory :most_recent, class: Todo do
    association :user
    title { "most_recent" }
    content { "most_recent" }
    created_at { Time.zone.now }
  end
end
