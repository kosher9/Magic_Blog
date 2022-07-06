class User < ApplicationRecord
  has_many :comments
  has_many :likes
  has_many :posts

  def three_recent_posts(author)
    Post.where(author:).limit(3)
  end
end
