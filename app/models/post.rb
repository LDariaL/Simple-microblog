class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  belongs_to :post_category, optional: true
  has_one_attached :image
  validates :content, presence: true, length: { maximum: 500 }
  validates :title, length: { maximum: 100 }, allow_nil: true
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png],
    message: "must be a valid image format" },
    size: { less_than: 100.megabytes,
    message: "should be less than 100MB" }
end
