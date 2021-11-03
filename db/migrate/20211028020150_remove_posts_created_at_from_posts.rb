class RemovePostsCreatedAtFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :posts_created_at, :datetime
  end
end
