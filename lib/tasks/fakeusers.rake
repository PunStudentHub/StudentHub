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
  end

end
