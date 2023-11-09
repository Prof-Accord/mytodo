FactoryBot.define do
  factory :todo, class: Todo do
    association :user
    title { "MyString" }
    content { "MyText" }
    created_at { 1.hours.ago }
  end

  factory :most_recent, class: Todo do
    association :user
    title { "most_recent_string" }
    content { "most_recent_text" }
    created_at { Time.zone.now }
  end
end
