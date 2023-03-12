# Creating fake users Rake-task (one the main user and other users)
User.destroy_all
@user = User.create(name: "Daria",
                    email: "daria@microblog.ru",
                    password: "qwertyqwerty",
                    password_confirmation: "qwertyqwerty",
                    admin: true,
                    # false in production
                    activated: true,
                    activated_at: Time.zone.now
)
Users::Activation.new(@user).call

30.times do |n|
  name = Faker::FunnyName.name
  email = "example-#{n + 1}@microblog.ru"
  password = "password"
  @user = User.create!(name: name,
                       email: email,
                       password: password,
                       password_confirmation: password,
                       # false in production
                       activated: true,
                       activated_at: Time.zone.now
  )
  Users::Activation.new(@user).call
end

PostCategory.destroy_all
20.times do |n|
  title = Faker::Science.element
  @post_category = PostCategory.create!(title: title)
end

Post.destroy_all
@users = User.order(:created_at).take(20)
10.times do |n|
  content = Faker::Lorem.sentences
  title = Faker::Verb.past
  @post_category_id = PostCategory.all.pluck(:id).sample
  @users.each do |user|
    user.posts.create!(content: content, title: title, post_category_id: @post_category_id)
  end
end