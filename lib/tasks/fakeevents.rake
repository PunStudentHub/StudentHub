namespace :fakeevents do
  desc "TODO"
  task load: :environment do
    50.times do |n|
      time = ((n/10).round - 1).days.from_now + 600
      big_time = time + 3600
      e = Event.new(title: Faker::Lorem.sentence[0..20], description: Faker::Lorem.paragraph, user_id: User.all.sample.id, location: Faker::Lorem.sentence[0..14], approved: !(n%3 == 0), start_time: time, end_time: big_time )
      e.save
    end
  end

end
