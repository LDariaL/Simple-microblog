module Users
  
  class PasswordReset

    include ModuleAuth

    def initialize(user)
      @user = user
    end
  
    def call
      downcase_email
      create_reset_token
      send_password_reset_email
      @user.save
    end

    def downcase_email
      @user.email = @user.email.downcase
    end
    
    def create_reset_token
      @user.reset_token = generate_new_token                   
      update_attribute(:reset_digest, @user.user_digest(reset_token))
      update_attribute(:reset_sent_at, Time.zone.now)   
    end

    def send_password_reset_email
       UserMailer.password_reset(@user).deliver_now
    end  

    def check_expiration
      if @user.password_reset_expired?
        flash[:danger] = "Password reset has expired"
        redirect_to new_password_reset url
    end

    def password_reset_expired?
      reset_sent_at < 2.hours.ago
    end  
  end
end   