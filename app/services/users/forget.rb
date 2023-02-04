module Users
  class Forget

    def initialize(user)
      @user = user
    end
    
    def call
      if @user
        @user.update_attribute(:remember_digest, nil)
      else
       false
      end  
    end  
  end  
end