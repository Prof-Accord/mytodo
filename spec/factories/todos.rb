FactoryBot.define do
  factory :todo do
    association :user
    title { "MyString" }
    content { "MyText" }
  end

  factory :potato, class: Todo do
    association :user
    title { "potato" }
    content { "potato" }
    # created_at { Time.zone.now }
  end

  factory :most_recent, class: Todo do
    association :user
    title { "most_recent" }
    content { "most_recent" }
    # created_at { 1.hours.ago }
  end
end
