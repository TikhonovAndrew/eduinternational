class CreateBranches < ActiveRecord::Migration[5.1]
  def change
    create_table :branches do |t|
      t.string :city
      t.string :name
      t.string :title
      t.text   :description
      t.decimal :google_map_latitude
      t.decimal :google_map_longitude
      t.string :address
      t.string :phone
      t.string :email
      t.datetime :opened_at
      t.has_attached_file :cover
      t.has_attached_file :branch_logo
      t.has_attached_file :slider_image
      t.has_attached_file :slider_image1
      t.string :video_link
      t.string :slug


      t.timestamps
    end

    add_index :branches, :slug, unique: true
  end
end
