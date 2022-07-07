class User < ApplicationRecord

  validates :name, length: { minimum: 1 }
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }

  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  has_many :posts, foreign_key: :author_id

  def three_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
