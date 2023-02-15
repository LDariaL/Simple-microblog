class User
  attr_accessor :name, :email

  def initialize(*args)
    @name = name
    @email = email
  end
end  

RSpec.describe User do
  
  let(:user) { User.new('Name','email') }

  it 'has a Name and email' do
    expect(user.name) == ('Name')
    expect(user.email) == ('email')
  end  
end