class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  after_save :update_post_counter

  def update_post_counter
    author.increment(:posts_counter)
  end

  def five_recent_comment(post)
    Comment.where(post:).order(created_at: :desc).limit(5)
  end
end
