namespace :cycle_days do
  desc "TODO"
  task load_days: :environment do
    %w{A B C D E F}.each do |day|
      CycleDay.create(letter: day)
    end
  end

  task load_data: :environment do
    CSV.foreach("#{Rails.root}/db/data/cycledays.csv") do |row|
      date = Date.parse(row[1])
      puts(date)
      if (date)
        unless (SchoolDay.find_by_date(date))
          CycleDay.find_by_letter(row[0]).school_days.build(date: date).save
        end
      end
    end
  end
end
