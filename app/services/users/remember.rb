module Users
  class Remember

    def initialize(user)
      @user = user
    end
    
    def call
      if user
        @user.remember_token = @user.generate_new_token
        @user.remember_digest = user_digest(@user.remember_token)
        @user.save
        @user
      else
       false
      end   
    end  

     # return TRUE IF the given token matches the user's digest
    def authenticated?(remember_token)
      return false if remember_digest.nil?
      BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
    
    def generate_new_token                  
      SecureRandom.urlsafe_base64    
    end

    def user_digest(string)             
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
  end
end