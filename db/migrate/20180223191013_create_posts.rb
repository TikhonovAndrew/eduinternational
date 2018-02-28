class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :title
      t.text :body
      t.has_attached_file :cover
      t.has_attached_file :post_image
      t.string :slug

      t.timestamps
    end

    add_index :posts, :slug, unique: true
    add_reference :posts, :branch, index: true, foreign_key: true
  end
end
