namespace :role do
  desc "TODO"
  task generate: :environment do
    Role.delete_all
    [
      { 
        name: "Admin",
        id: 1,
        color: "ef4040",
        approve: true,
        moderate: true,
        admin: true, 
        blog: true,
        faculty_mod: true
      },
      { 
        name: "Moderator",
        id: 2,
        color: "32ba3d",
        approve: true,
        moderate: true
      },
      { 
        name: "Dean",
        id: 3,
        color: "800008",
        approve: true,
        moderate: true,
        admin: true,
        faculty_mod: true
      },
      {
        name: "PLC",
        id: 4,
        color: "800080"
      },
      {
        name: "Faculty",
        id: 5,
        color: "ffae00"
      },
      {
        name: "Banned",
        id: 6,
        color: "333333",
        banned: true
      },
      {
        name: "Faculty Moderator",
        id: 7,
        color: "301d70",
        faculty_mod: true
      }
    ].each do |r|
      Role.create!(r)
    end

    Role.find(7).update_attribute(:faculty_mod, true)
    Role.find(3).update_attribute(:faculty_mod, true)
  end

end
