class RemovePostsUpdatedAtFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :posts_updated_at, :datetime
  end
end
