class StaticPagesController < ApplicationController
  
  def home 
    @posts = @current_user.posts.paginate(page: params[:page] per_page: 30)
  end

  def help
  end

  def about
  end  

  def contact
  end  

end