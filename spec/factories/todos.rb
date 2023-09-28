FactoryBot.define do
  factory :todo do
    user { nil }
    title { "MyString" }
    body { "MyText" }
    status { 1 }
  end
end
