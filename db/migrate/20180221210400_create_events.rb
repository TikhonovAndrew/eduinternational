class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :subject
      t.string :location
      t.text :description
      t.datetime :event_date_time
      t.datetime :event_date_time_end
      t.string :slug
      t.decimal :google_map_latitude
      t.decimal :google_map_longitude
      t.has_attached_file :cover
      t.has_attached_file :event_image
      t.has_attached_file :event_image1  
      
      t.timestamps null: false
    end
    
    add_index :events, :slug, unique: true
    add_reference :events, :branch, index: true, foreign_key: true
  end
end
