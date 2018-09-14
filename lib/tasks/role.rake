namespace :role do
  desc "TODO"
  task generate: :environment do
    Role.delete_all
    [
      { 
        name: "Admin",
        color: "ef4040",
        approve: true,
        moderate: true,
        admin: true, 
        blog: true
      },
      { 
        name: "Moderator",
        color: "32ba3d",
        approve: true
      },
      { 
        name: "Dean",
        color: "8e25a8",
        approve: true,
        moderate: true,
        admin: true
      }
    ].each do |r|
      Role.create!(r)
    end
  end

end
