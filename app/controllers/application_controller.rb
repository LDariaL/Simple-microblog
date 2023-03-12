class ApplicationController < ActionController::Base
  include SessionsHelper
  include Authenticate

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Log in"
      redirect_to login_url
    end
  end
end
