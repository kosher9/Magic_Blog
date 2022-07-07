class User < ApplicationRecord
  has_many :comments
  has_many :likes
  has_many :posts

  validate :name, length: { minimum: 1 }
  validate :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def three_recent_posts(author)
    Post.where(author:).order(created_at: :desc).limit(3)
  end
end
