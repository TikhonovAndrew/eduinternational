class CreateTestimonials < ActiveRecord::Migration[5.1]
  def change
    create_table :testimonials do |t|
      t.string :name
      t.string :surname
      t.string :category
      t.string :school
      t.text   :body
      t.string :slug
      t.has_attached_file :cover
      t.has_attached_file :author_photo


      t.timestamps
    end
    add_index :testimonials, :slug, unique: true
    add_reference :testimonials, :branch, index: true, foreign_key: true
  end
end
