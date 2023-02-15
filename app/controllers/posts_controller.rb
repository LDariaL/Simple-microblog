class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def index
    @post_categories = PostCategory.all
    @posts = Post.where("post_category_id = ?", PostCategory.first.id).paginate(page: params[:page], per_page: 30)
    @random_posts = Post.limit(3)
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = @current_user.posts.build(post_params)
    @post.image.attach(params[:post][:image])
    if @post.save
      flash[:success] = "Post created."
      redirect_to root_url
    else
      render "static_page/home"  
    end  
  end

  def new
    @post = @current_user.posts.build if logged_in?
  end

  #def feed
  #  Post.where("user_id = ?", current_user.id)
  #end  
  
  def destroy
    @post.destroy
    flash[:success] = "Post deleted."
    redirect_to :back
  end  

  private

  def post_params
    params.require(:post).permit(:title, :post_category_id, :content, :image)
  end  

  def correct_user
    @post = current_user.post.find_by(:id, user_params[:id])
    redirect_to root_url if @post.nil?
  end
end
