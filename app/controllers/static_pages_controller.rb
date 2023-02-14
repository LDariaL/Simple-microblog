class StaticPagesController < ApplicationController
  
  def home 
    @posts = current_user.posts.paginate(page: params[:page])
    @post = current_user.posts.build if logged_un?
  end

  def help
  end

  def about
  end  

  def contact
  end  

end