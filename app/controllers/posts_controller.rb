class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def index
    @post_categories = PostCategory.all
    @posts = Post.where("post_category_id = ?", PostCategory.first.id)
  end

  def show
    @post = Post.find_by("id = ?", params[:created_at],[:post_id])
  end

  def update
    @posts = Post.where("post_category_id = ?", params[:post_category_id])
    respond_to do |format|
      format.js
    end
  end   

  def create
    @post = @current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created."
      redirect_to root_url
    else
      render "static_page/home"  
  end

  def new
    @post = @current_user.posts.build if logged_in?
  end
  
  def destroy
  end  

  private

   def post_params
    params.require[:post].permit(:content, :title, :post_category_id)
   end  
end
