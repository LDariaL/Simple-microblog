class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password]) 
  # if user && user.authenticate(params[:session][:password])                   # if statemet is true only IF a user with the given email exists in the database
  # params hash where params[:session][:email] and params[:session][:password]  # AND (&&) has the given password
      log_in user
      redirect_to user
    else
    flash.now[:danger] = "Invalid email or password"
    render 'new'
    end
  end
  
  def destroy
    log_out
    redirect_to root_url
  end  

end
