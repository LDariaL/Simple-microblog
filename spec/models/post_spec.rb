class Post
  attr_accessor :title, :content, :user_id, :post_category_id, :images

  def initialize(*args)
    @title = title
    @content = content
    @user_id = user_id
    @post_category_id = post_category_id
    @images = images
  end
end

RSpec.describe Post do

  let(:post) { Post.new('Title', 'Content') }

  it 'has a title and content' do
    expect(post.title) == ('Title')
    expect(post.content) == ('Content')
  end

  it 'belongs to user' do
    expect(post.user_id) == ('user_id')
  end

  it 'has and can has not category' do
    expect(post.post_category_id) == ('post_category_id')
    post_category_id = nil
    expect(post.post_category_id) == nil
  end

end  