module Authenticate

  # return TRUE IF the given token matches the user's digest
  def authenticated?(attribute, token)
    digest = @user.send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def generate_new_token
    SecureRandom.urlsafe_base64
  end

  def user_digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
             BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def check_expiration
    if password_reset_expired?
      raise " _ "
    end
  end

  def password_reset_expired?
    @user.reset_sent_at < 2.hours.ago
  end
end