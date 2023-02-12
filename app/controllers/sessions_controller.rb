class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
  # "safe navigation" operator &.   obj && obg.method = obg&.method
    if user&.authenticate(params[:session][:password]) 
  # if user && user.authenticate(params[:session][:password])                   # if statemet is true only IF a user with the given email exists in the database
  # params hash where params[:session][:email] and params[:session][:password]  # AND (&&) has the given password
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? Users::Remember.new(user).call : Users::Forget.new(user).call
        redirect_back_or user
      else
        message = "Account not activated!"
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
    flash.now[:danger] = "Invalid email or password"
    render 'new'
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end  
end