class Post < ApplicationRecord
  after_save :update_post_counter

  has_many :likes, dependent: :nullify
  has_many :comments, dependent: :nullify
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  validates :title, length: { in: 1..250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_post_counter
    author.increment!(:posts_counter)
  end

  def five_recent_comment
    Comment.order(created_at: :desc).includes(:author).limit(5)
  end
end
