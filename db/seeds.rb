# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(username: "渡邉　将太朗", email: "watanabe@gmail.com", password: "foobar", password_confirmation: "foobar")

5.times do |n|
  User.create!(
    # email: "test#{n + 1}@test.com",
    email: Faker::Internet.email,
    # username: "テストユーザー#{n + 1}",
    username: Faker::Name.name,
    password: "password#{n + 1}"
  )
end

5.times do |n|
  User.all.each do |user|
    user.todos.create!(
      title: Faker::Book.title,
      content: Faker::Lorem.paragraph,
    )
  end
end