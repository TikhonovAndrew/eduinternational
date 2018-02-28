class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :name
      t.text :about
      t.text :summary
      t.string :slug
      t.string :video
      t.string :category
      t.string :link
      t.has_attached_file :cover
      t.has_attached_file :school_image

      t.timestamps null: false
    end

    add_index :schools, :slug, unique: true
    add_reference :schools, :country, index: true, foreign_key: true
    add_reference :schools, :branch, index: true, foreign_key: true
  end
end
