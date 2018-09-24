namespace :classyear do
  desc "TODO"
  task load: :environment do
    4.times do |n|
      year = 2019 + n
      ClassYear.create!(id: year)
    end
  end

end
