namespace :fakeclubs do
  desc "TODO"
  task load: :environment do
    50.times do |n|
      e = Club.new(name: Faker::Lorem.sentence[0..20], description: Faker::Lorem.paragraph, president_id: User.all.sample.id, approved: !(n%3 == 0), rejected: false)
      e.save
    end
  end

end
