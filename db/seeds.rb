require 'faker'
# Create a main sample user.
User.create!(name:  "Tony Nguyen",
             email: "tnguyen15@live.maryville.edu",
             password:              "foobar",
             role:     true,
             password_confirmation: "foobar")

# Generate 5 sellers.
20.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@example.org"
    password = "password"
    User.create!(name:  name,
                 email: email,
                 password:              password,
                 role: false,
                 password_confirmation: password)
end

# Generate 90 buyers.
# 90.times do |n|
#     name  = Faker::Name.name
#     email = "example-#{n+1+5}@example.org"
#     password = "password"
#     User.create!(name:  name,
#                  email: email,
#                  password:              password,
#                  role: false,
#                  password_confirmation: password)
# end

# Generate products for a subset of users
users = User.order(:created_at).take(1)
50.times do |n|
    name = Faker::Commerce.unique.product_name
    description = Faker::Hipster.sentence(word_count: rand(5..10))
    price = rand(5..500)
    users.each { |user| user.products.create!(name: name, description: description, price: price)}
end