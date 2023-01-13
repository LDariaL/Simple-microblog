module SessionsHelper
    # вход пользователя
    def log_in(user)
        session[:user_id] = user.id
    end
    # возвращает текущего пользователя, если уже есть (не ищет каждый раз по id в базе)
    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end     
end
