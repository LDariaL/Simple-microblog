class StaticPagesController < ApplicationController

  def home
    @posts = current_user ? current_user.posts.paginate(page: params[:page]) : Post.all.limit(5)
    @post = current_user.posts.build if logged_in?
  end

  #def help
  #end

  #def about
  #end

  #def contact
  #end

end
