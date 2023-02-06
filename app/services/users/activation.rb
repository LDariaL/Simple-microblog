module Users
  
  class Activation

    include ModuleAuth

    def initialize(user)
      @user = user
    end
  
    def call
      downcase_email
      create_activation_token
      @user.save
    end

    def downcase_email
      @user.email = @user.email.downcase!
    end
    
    def create_activation_token
      @user.activation_token = generate_new_token 
      @user.activation_digest = user_digest(@user.activation_token)
    end
  end
end      