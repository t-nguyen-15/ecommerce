require 'faker'
# Create a main sample user.
User.create!(name:  "Tony Nguyen",
             email: "tnguyen15@live.maryville.edu",
             password:              "foobar",
             role:     true,
             password_confirmation: "foobar")

# Generate a bunch of additional sellers.
99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@example.org"
    password = "password"
    User.create!(name:  name,
                 email: email,
                 password:              password,
                 role: true,
                 password_confirmation: password)
end

# Generate products for a subset of users
users = User.order(:created_at).take(6)
50.times do |n|
    name = "product-#{n+1}"
    description = Faker::Lorem.sentence(word_count: 5)
    price = 9.99
    users.each { |user| user.products.create!(name: name, description: description, price: price)}
end