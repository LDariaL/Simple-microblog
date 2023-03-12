module Auth
  def generate_new_token
    SecureRandom.urlsafe_base64
  end

  def user_digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
             BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end