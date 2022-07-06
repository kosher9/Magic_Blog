class FixCommentCounterName < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :comment_counter, :comments_counter
    rename_column :users, :post_counter, :posts_counter
  end
end
