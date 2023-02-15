class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  belongs_to :post_category
  has_many_attached :images
  validates :content, presence: true, length: { maximum: 500 }
  validates :title, length: { maximum: 100 }, allow_nil: true
  validates :images, content_type: { in: %w[image/jpeg image/gif image/png],
    message: "must be a valid image format" },
    size: { less_than: 40.megabytes,
    message: "should be less than 40MB" }
end
