class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :branch
      t.string :name
      t.string :title
      t.text :body
      t.datetime :published_at
      t.has_attached_file :cover
      t.has_attached_file :post_image
      t.string :slug

      t.timestamps
    end

    add_index :posts, :slug, unique: true
  end
end
