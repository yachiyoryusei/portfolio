class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :type
      t.integer :category_id
      t.integer :amount
      t.text :note
      t.date :date
      t.datetime :posts_created_at
      t.datetime :posts_updated_at

      t.timestamps
    end
  end
end
