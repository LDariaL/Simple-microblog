class PostCategoriesController < ApplicationController
  def show
    @post_category = PostCategory.find(params[:id])
    @posts = @post_category.posts.order('created_at DESC').limit(20)
  end
end
