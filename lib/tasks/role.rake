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
        teach: true
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
        teach: true
      },
      {
        name: "PLC",
        id: 4,
        color: "800080"
      },
      {
        name: "Faculty",
        id: 5,
<<<<<<< HEAD
        color: "ffae00",
        teach: true

=======
        color: "ffae00"
>>>>>>> master
      },
      {
        name: "Banned",
        id: 6,
        color: "333333",
        banned: true
<<<<<<< HEAD

=======
>>>>>>> master
      }
    ].each do |r|
      Role.create!(r)
    end
  end

end
