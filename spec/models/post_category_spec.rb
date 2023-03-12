class PostCategory
  attr_accessor :title

  def initialize(*args)
    @title = title
  end
end

RSpec.describe PostCategory do

  let(:post_category) { PostCategory.new('Title') }

  it 'has a title' do
    expect(post_category.title) == ('Title')
  end
end