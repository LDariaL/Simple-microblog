module SessionsHelper
    # вход пользователя
    def log_in(user)
        session[:user_id] = user.id
    end
    # запоминает пользователя
    def remember(user)     
        user.remember      # user.remember - это self.метод из User model
        cookies.permanent.encrypted[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end    
    # возвращает текущего пользователя, если уже есть (не ищет каждый раз по id в базе), обеспечение сессии
    def current_user
        if (user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
      elsif (user_id = cookies.encrypted[:user_id])
            user = User.find_by(id: user_id)
        if user && user.authenticated?(cookies[:remember_token])
            log_in user
            @current_user = user
        end    
      end
    end     
    # returns true if the user is logged in (current_user != nil), false otherwise
    def logged_in?
        !current_user.nil?
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