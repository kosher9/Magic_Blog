class Post < ApplicationRecord

  validates :title, length: { in: 1..250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :likes, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  after_save :update_post_counter

  def update_post_counter
    author.increment(:posts_counter)
  end

  def five_recent_comment(post)
    Comment.where(post:).order(created_at: :desc).limit(5)
  end
end
