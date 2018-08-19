# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#User.create!(name: "Example User",
#             email: "example@punahou.edu", 
#             password: "password",
#             password_confirmation: "password", 
#             admin: true)


#10.times do |n|
#  name = Faker::Name.name
#  email = "example-#{n+1}@punahou.edu"
#  password = "password"
#  User.create!(name: name, email: email, password: password, password_confirmation: password)
#end

4.times do |n|
  year = 2019 + n
  ClassYear.create!(id: year)
end