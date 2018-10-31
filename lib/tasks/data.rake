namespace :data do
  desc "TODO"
  task load_all: :environment do
    tasks = %W{cycle_days:load_days classyear:load role:generate 
      fakeusers:load plc:import fakeannouncements:load fakeevents:load }
    tasks.each do |task| 
      Rake::Task[task].invoke
    end
    
  
  end

end
