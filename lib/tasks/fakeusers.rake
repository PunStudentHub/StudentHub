namespace :fakeusers do
  desc "TODO"
  task load: :environment do
    User.create!(name: "Admin User",
                email: "example@punahou.edu",
                roles: [Role.find(1)],
                )


    50.times do |n|
     name = Faker::Name.name
     email = "example-#{n+1}@punahou.edu"
     User.create!(name: name, email: email)
    end


    6.times do |day|
      8.times do |mod|
        Timeslot.create(day: day, time: mod)
      end
    end
  end

end
