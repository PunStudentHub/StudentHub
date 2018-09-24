class CreateBlogPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.text :content
      t.string :hash_id, index: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
