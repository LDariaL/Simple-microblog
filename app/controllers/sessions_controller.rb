class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])         # if statemet is true only IF a user with the given email exists in the database
                                                                      # AND (&&) has the given password
    else
    flash.now[:danger] = "Invalid email or password"
    render 'new'
    end
  end
  
  def destroy

  end  

end
