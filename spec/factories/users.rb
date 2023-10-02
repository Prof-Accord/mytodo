FactoryBot.define do
  factory :user do
    # name { Faker::Name.name }
    name { '' }
    # email { Faker::Internet.email }
    email { '' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
