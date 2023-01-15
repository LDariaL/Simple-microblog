class User < ApplicationRecord
    attr_accessor :remember_token
    before_save { email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: { minimum: 8 }   

# we can use self methods through class << self   

# return the hash digest of the string
    def User.digest(string)             # = self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
    end
# generates a random token for the user
    def User.new_token                  # = self.new_token
        SecureRandom.urlsafe_base64    
    end

# remembering the user for a persistent session (...is used in SessionsHelper)   
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end    

# return TRUE IF the given token matches the user's digest
    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
# forgets a user    
    def forget
        update_attribute(:remember_digest, nil)
    end    
end