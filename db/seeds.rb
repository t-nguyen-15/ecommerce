require 'faker'
# Create a main sample user.
User.create!(name:  "Tony Nguyen",
             email: "tnguyen15@live.maryville.ed",
             password:              "foobar",
             role:     true,
             password_confirmation: "foobar",
             activated: true,
             activated_at: Time.zone.now)