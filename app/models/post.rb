class Post < ApplicationRecord
  belongs_to :user
  belongs_to :post_category
  validates :content, presence: true
end
