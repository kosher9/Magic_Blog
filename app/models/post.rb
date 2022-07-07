class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  after_save :update_post_counter

  validate :title, length: { in: 1..250 }
  validate :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_post_counter
    author.increment(:posts_counter)
  end

  def five_recent_comment(post)
    Comment.where(post:).order(created_at: :desc).limit(5)
  end
end
