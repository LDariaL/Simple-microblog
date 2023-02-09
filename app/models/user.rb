class User < ApplicationRecord
    attr_accessor :remember_token, :activation_token
#   before_save :activate_email
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: { case_sensitive: false }
    has_secure_password
# allow nil password it might be useful for the tests; the users can't sign up with empty password because has_secure_password method doesn't allow it
    validates :password, presence: true, length: { minimum: 8 }, allow_nil: true

end