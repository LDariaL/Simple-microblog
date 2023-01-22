module SessionsHelper
  # вход пользователя
  def log_in(user)
      session[:user_id] = user.id
  end
  # запоминает пользователя
  def remember_from_helper(user)     
    user&.remember_from_model   
      if defined? cookies  
        cookies.permanent.encrypted[:user_id] = user.id 
        cookies.permanent[:remember_token] = user.remember_token  
      end
  end    
  # возвращает текущего пользователя, если уже есть (не ищет каждый раз по id в базе), обеспечение сессии
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies.encrypted[:user_id])
          user = User.find_by(id: user_id)
        if user&.authenticated?(cookies[:remember_token])
          log_in user
          @current_user = user
        end    
    end
  end   
    
  # returns true if the given user == current user
  def current_user?(user)
    user && user == current_user
  end  

  # returns true if the user is logged in (current_user != nil), false otherwise
  def logged_in?
    !current_user.nil?
  end    

  # redirect to stored or to default location
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # stores the URL that user want to access
  def store_location
    session[:forwarding_url] = request.original_url if request.get?  
  end

  # a persistent session is stopped existing
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end    

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end    
end