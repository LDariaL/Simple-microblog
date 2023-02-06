# Creating fake users Rake-task (one the main user and other users)

User.create!(name:                 "Daria",
            email:                 "daria@microblog.ru",   
            password:              "qwertyqwerty",
            password_confirmation: "qwertyqwerty",
            admin:                  true,
            activated:              true, 
            activated_at:           Time.zone.now
            )
            
            
99.times do |n|
  name       =      Faker::Name.name
  email      =      "example-#{n+1}@microblog.ru"
  password   =      "password"
  User.create!(name:                 name,
              email:                 email,
              password:              password,
              password_confirmation: password,
              activated:             true,
              activated_at:          Time.zone.now
              )            
end               