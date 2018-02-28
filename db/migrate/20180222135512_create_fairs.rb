class CreateFairs < ActiveRecord::Migration[5.1]
  def change
    create_table :fairs do |t|	
      t.string :name
      t.string :location
      t.text :description
      t.datetime :fair_date_time
      t.datetime :fair_date_time_end
      t.string :slug
      t.decimal :google_map_latitude
      t.decimal :google_map_longitude
      t.has_attached_file :cover
      t.has_attached_file :fair_image   
      
      t.timestamps null: false
    end
    
    add_index :fairs, :slug, unique: true
    add_reference :fairs, :branch, index: true, foreign_key: true
  end
end
