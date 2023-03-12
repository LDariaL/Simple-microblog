module Users
  class Remember

    include Auth

    def initialize(user)
      @user = user
    end

    def call
      if @user
        @user.remember_token = generate_new_token
        @user.remember_digest = user_digest(@user.remember_token)
        @user.save
        @user
      else
        false
      end
    end

  end
end