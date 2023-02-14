class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  belongs_to :post_category
  validates :content, presence: true, length: { maximum: 500 }
  validates :title, length: { maximum: 100 }, allow_nil: true
end
