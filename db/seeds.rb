# Creating fake users Rake-task (one the main user and other users)
User.destroy_all
@user = User.create(name:          "Daria",
            email:                 "daria@microblog.ru",   
            password:              "qwertyqwerty",
            password_confirmation: "qwertyqwerty",
            admin:                  true,
            #false in production
            activated:              true,                           
            activated_at:           Time.zone.now
            )
            Users::Activation.new(@user).call
            
30.times do |n|
  name       =      Faker::Name.name
  email      =      "example-#{n+1}@microblog.ru"
  password   =      "password"
 @user =  User.create!(name:        name,
             email:                 email,
             password:              password,
             password_confirmation: password,
             #false in production
             activated:             true,                        
             activated_at:          Time.zone.now
             )        
             Users::Activation.new(@user).call    
end               