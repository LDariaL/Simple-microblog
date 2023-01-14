module SessionsHelper
    # вход пользователя
    def log_in(user)
        session[:user_id] = user.id
    end
    # возвращает текущего пользователя, если уже есть (не ищет каждый раз по id в базе), обеспечение сессии
    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end     
    # returns true if the user is logged in (current_user != nil), false otherwise
    def logged_in?
        !current_user.nil?
    end    

    def log_out
        session.delete(:user_id)
        @current_user = nil
    end    
end