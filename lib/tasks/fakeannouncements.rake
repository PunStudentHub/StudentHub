namespace :fakeannouncements do
  desc "TODO"
  task load: :environment do
    50.times do |n|
      class_years = ClassYear.all.sample((1..4).to_a.sample)
      a = Announcement.new(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph, user_id: User.all.sample.id)
      a.class_years << class_years
      a.save
    end
  end
end
