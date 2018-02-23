class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :branch
      t.string :name
      t.text :body
      t.datetime :published_at
      t.has_attached_file :cover
      t.has_attached_file :post_image

      t.timestamps
    end

    add_index :posts, :slug, unique: true
    add_reference :posts, :team_member, index:true, foreign_key: true
  end
end
