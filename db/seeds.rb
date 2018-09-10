# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "Admin User",
            email: "example@punahou.edu",
            admin: true,
            )


50.times do |n|
 name = Faker::Name.name
 email = "example-#{n+1}@punahou.edu"
 User.create!(name: name, email: email)
end

4.times do |n|
  year = 2019 + n
  ClassYear.create!(id: year)
end

50.times do |n|
  class_years = ClassYear.all.sample((1..4).to_a.sample)
  a = Announcement.new(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph, user_id: User.all.sample.id)
  a.class_years << class_years
  a.save
end

6.times do |day|
  8.times do |mod|
    Timeslot.create(day: day, time: mod)
  end
end